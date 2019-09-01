//
//  HomeService.swift
//  RebellionTrips
//
//  Created by Arturo on 9/1/19.
//  Copyright © 2019 AM. All rights reserved.
//

import Foundation
import RxSwift

final class HomeService {
    private let client: ServiceClient<Trip>
    
    init(client: ServiceClient<Trip>) {
        self.client = client
    }
    
    func fetchTrips() -> Single<[Trip]> {
        return client.requestElements(verb: .get, endpoint: ServiceEndpoint.trips.rawValue, parameters:  nil)
    }
}
