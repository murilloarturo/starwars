//
//  Utils.swift
//  RebellionTripsTests
//
//  Created by Arturo on 9/1/19.
//  Copyright © 2019 AM. All rights reserved.
//

import Foundation

class TestClass {
    init() {}
}

enum TestingError: Int, Error {
    case fileNotFound
    
    var localizedDescription: String {
        return "File not found"
    }
}

class Utils {
    func bundle() -> Bundle {
        return Bundle(for: TestClass.self)
    }
    
    func getData(for file: String) throws -> [String: Any] {
        let data = try readDictionaryJson(fileName: file)
        return data
    }
    
    func getDataArray(for file: String) throws -> [[String: Any]] {
        let data = try readArrayJson(fileName: file)
        return data
    }
    
    func readDictionaryJson(fileName: String) throws -> [String: Any] {
        if let file = bundle().url(forResource: fileName, withExtension: "json") {
            let data = try Data(contentsOf: file)
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            if let object = json as? [String: Any] {
                return object
            }
        }
        throw TestingError.fileNotFound
    }
    
    func readArrayJson(fileName: String) throws -> [[String: Any]] {
        if let file = bundle().url(forResource: fileName, withExtension: "json") {
            let data = try Data(contentsOf: file)
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            if let object = json as? [[String: Any]] {
                return object
            }
        }
        throw TestingError.fileNotFound
    }
}
