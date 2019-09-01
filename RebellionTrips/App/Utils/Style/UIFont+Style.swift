//
//  UIFont+Style.swift
//  RebellionTrips
//
//  Created by Arturo on 9/1/19.
//  Copyright © 2019 AM. All rights reserved.
//

import UIKit

enum FontStyle: String {
    case bold = "SFUIText-Bold"
    case boldItalic = "SFUIText-BoldItalic"
    case heavy = "SFUIText-Heavy"
    case heavyItalic = "SFUIText-HeavyItalic"
    case light = "SFUIText-Light"
    case lightItalic = "SFUIText-LightItalic"
    case medium = "SFUIText-Medium"
    case mediumItalic = "SFUIText-MediumItalic"
    case regular = "SFUIText-Regular"
    case regularItalic = "SFUIText-RegularItalic"
    case semibold = "SFUIText-Semibold"
    case semiboldItalic = "SFUIText-SemiboldItalic"
    
    func font(size: CGFloat) -> UIFont? {
        return UIFont(name: rawValue, size: size)
    }
}

enum FontType {
    case bigTitle
    case title
    case subtitle
    
    var style: FontStyle {
        switch self {
        case .bigTitle, .title:
            return FontStyle.semibold
        case .subtitle:
            return FontStyle.medium
        }
    }
    
    var size: CGFloat {
        switch self {
        case .bigTitle:
            return 17
        case .title:
            return 15
        case .subtitle:
            return 13
        }
    }
}
