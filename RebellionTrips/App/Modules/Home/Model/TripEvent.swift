//
//  TripEvent.swift
//  RebellionTrips
//
//  Created by Arturo on 9/1/19.
//  Copyright © 2019 AM. All rights reserved.
//

import Foundation

final class TripEvent: Codable {
    var planet: String
    var planetImage: String
    var date: Date
    
    enum CodingKeys: String, CodingKey {
        case planet = "name"
        case planetImage = "picture"
        case date
    }
}
