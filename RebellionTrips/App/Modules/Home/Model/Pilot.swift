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
    var avatarPath: String?
    var rating: Float
    
    var avatarURL: URL? {
        guard let path = avatarPath else { return nil }
        let host = ServiceEndpoint.host.rawValue
        let url = "\(host)\(path)"
        return URL(string: url)
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case avatarPath = "avatar"
        case rating
    }
}
