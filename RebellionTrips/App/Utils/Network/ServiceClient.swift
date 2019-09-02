//
//  ServiceClient.swift
//  RebellionTrips
//
//  Created by Arturo on 9/1/19.
//  Copyright © 2019 AM. All rights reserved.
//

import Alamofire
import RxSwift

enum ServiceEndpoint: String {
    case host = "https://starwars.kapten.com"
    case trips = "/trips"
}

enum ServiceError: Int, Error {
    case parsing
    case notFound = 404
    
    var localizedDescription: String {
        return LocalizableString.errorOccurred.localized
    }
}

enum HttpVerb: String {
    case get, post , put, head, delete, patch
    
    var alamofireVerb: Alamofire.HTTPMethod {
        switch self {
        case .get:
            return .get
        case .post:
            return .post
        case .put:
            return .put
        case .head:
            return .head
        case .delete:
            return .delete
        case .patch:
            return .patch
        }
    }
}

protocol APIServible {
    associatedtype Element
    
    func requestElement(verb: HttpVerb, endpoint: String, parameters: [String: Any]?) -> Single<Element>
    func requestElements(verb: HttpVerb, endpoint: String, parameters: [String: Any]?) -> Single<[Element]>
}

open class ServiceClient<Element: Codable>: APIServible {
    private var baseUrl: String
    
    init(baseUrl: String? = nil) {
        self.baseUrl = baseUrl ?? ServiceEndpoint.host.rawValue
    }
    
    func requestElement(verb: HttpVerb, endpoint: String, parameters: [String: Any]?) -> Single<Element> {
        let url = baseUrl + endpoint
        return .create(subscribe: { (single) -> Disposable in
            let disposable = Disposables.create()
            Alamofire
                .request(url, method: verb.alamofireVerb, parameters: parameters)
                .responseJSON(completionHandler: { (response) in
                    switch response.result {
                    case .success(let data):
                        if let json = data as? [String: Any],
                            let element: Element = try? JSONDecoder.model(with: json) {
                                single(.success(element))
                        } else {
                            single(.error(ServiceError.parsing))
                        }
                    case .failure(let error):
                        single(.error(error))
                    }
                })
            return disposable
        })
    }
    
    func requestElements(verb: HttpVerb, endpoint: String, parameters: [String: Any]?) -> Single<[Element]> {
        let url = baseUrl + endpoint
        return .create(subscribe: { (single) -> Disposable in
            let disposable = Disposables.create()
            Alamofire
                .request(url, method: verb.alamofireVerb, parameters: parameters)
                .responseJSON(completionHandler: { (response) in
                    switch response.result {
                    case .success(let data):
                        if let json = data as? [[String: Any]],
                            let elements: [Element] = try? JSONDecoder.array(with: json) {
                            single(.success(elements))
                        } else {
                            single(.error(ServiceError.parsing))
                        }
                    case .failure(let error):
                        single(.error(error))
                    }
                })
            return disposable
        })
    }
}
