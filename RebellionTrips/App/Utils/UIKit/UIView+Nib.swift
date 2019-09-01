//
//  UIView+Nib.swift
//  RebellionTrips
//
//  Created by Arturo on 9/1/19.
//  Copyright © 2019 AM. All rights reserved.
//

import UIKit

extension UIView {
    class func fromNib<T: UIView>(using bundle: Bundle) -> T {
        guard let view = bundle.loadNibNamed(String(describing: T.self), owner: nil, options: nil)?[0] as? T else {
            let message = "Can't get Xib from \(String(describing: T.self)) "
            fatalError(message)
        }
        return view
    }
}

