//
//  Pilot.swift
//  RebellionTrips
//
//  Created by Arturo on 9/1/19.
//  Copyright © 2019 AM. All rights reserved.
//

import Foundation

final class Pilot: Codable {
    var name: String
    var avatar: String?
    var rating: Float
    
    enum CodingKeys: CodingKey {
        case name
        case avatar
        case rating
    }
}
