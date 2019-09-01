//
//  Distance.swift
//  RebellionTrips
//
//  Created by Arturo on 9/1/19.
//  Copyright © 2019 AM. All rights reserved.
//

import Foundation

final class Distance: Codable {
    var value: Int
    var unit: String
    
    enum CodingKeys: CodingKey {
        case value
        case unit
    }
}
