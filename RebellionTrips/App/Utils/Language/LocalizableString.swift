//
//  LocalizableString.swift
//  RebellionTrips
//
//  Created by Arturo on 9/1/19.
//  Copyright © 2019 AM. All rights reserved.
//

import Foundation

enum LocalizableString: String {
    case lastTrips
    case errorOccurred
    
    var localized: String {
        return localize()
    }
    
    func localized(with param: CVarArg) -> String {
        return String(format: localized, param)
    }
}

private extension LocalizableString {
    func localize() -> String {
        let mainBundle = Bundle.main
        return NSLocalizedString(rawValue, tableName: nil, bundle: mainBundle, value: "", comment: "")
    }
}
