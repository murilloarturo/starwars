//
//  Trip.swift
//  RebellionTrips
//
//  Created by Arturo on 9/1/19.
//  Copyright © 2019 AM. All rights reserved.
//

import Foundation

final class Trip: Codable {
    var id: Int
    var pilot: Pilot
    var distance: Distance
    var duration: Int
    var pickUp: TripEvent
    var dropOff: TripEvent
    
    enum CodingKeys: String, CodingKey {
        case id
        case pilot
        case distance
        case duration
        case pickUp = "pick_up"
        case dropOff = "drop_off"
    }
}
