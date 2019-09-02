//
//  MockServiceClient.swift
//  RebellionTripsTests
//
//  Created by Arturo on 9/1/19.
//  Copyright © 2019 AM. All rights reserved.
//

import Foundation
import RxSwift
@testable import RebellionTrips

class MockServiceClient: ServiceClient<Trip> {
    private let path: String?
    
    override init(baseUrl: String? = nil) {
        self.path = baseUrl
    }
    
    override func requestElement(verb: HttpVerb, endpoint: String, parameters: [String : Any]?) -> Single<Trip> {
        return .create(subscribe: { (single) -> Disposable in
            let disposable = Disposables.create()
            do {
                let json = try Utils().getData(for: self.path ?? "trip")
                let element: Trip = try JSONDecoder.model(with: json)
                single(.success(element))
            } catch (let error) {
                single(.error(error))
            }
            return disposable
        })
    }
    
    override func requestElements(verb: HttpVerb, endpoint: String, parameters: [String : Any]?) -> Single<[Trip]> {
        return .create(subscribe: { (single) -> Disposable in
            let disposable = Disposables.create()
            do {
                let json = try Utils().getDataArray(for: self.path ?? "trips")
                let elements: [Trip] = try JSONDecoder.array(with: json)
                single(.success(elements))
            } catch (let error) {
                single(.error(error))
            }
            return disposable
        })
    }
}
