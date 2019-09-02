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
    case header1
    case header2
    case title
    case subtitle
    
    var style: FontStyle {
        switch self {
        case .header1:
            return .heavy
        case .header2, .title:
            return .semibold
        case .subtitle:
            return .medium
        }
    }
    
    var size: CGFloat {
        switch self {
        case .header1:
            return 28
        case .header2:
            return 17
        case .title:
            return 15
        case .subtitle:
            return 13
        }
    }
}
