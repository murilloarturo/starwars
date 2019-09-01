//
//  JSONDecoder+Codable.swift
//  RebellionTrips
//
//  Created by Arturo on 9/1/19.
//  Copyright © 2019 AM. All rights reserved.
//

import Foundation

extension JSONDecoder {
    static func model<T: Decodable>(with jsonDictionary: [String : Any], dateStrategy: DateDecodingStrategy = .iso8601) throws -> T {
        let dataJson = try JSONSerialization.data(withJSONObject: jsonDictionary, options: .prettyPrinted)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = dateStrategy
        return try decoder.decode(T.self, from: dataJson)
    }
    
    static func array<T: Decodable>(with jsonArray: [[String : Any]], dateStrategy: DateDecodingStrategy = .iso8601) throws -> [T] {
        return try jsonArray.map { try JSONDecoder.model(with: $0, dateStrategy: dateStrategy) }
    }
}
