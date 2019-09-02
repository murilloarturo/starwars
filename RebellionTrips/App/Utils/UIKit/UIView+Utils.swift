//
//  UIView+Constraint.swift
//  RebellionTrips
//
//  Created by Arturo on 9/1/19.
//  Copyright © 2019 AM. All rights reserved.
//

import UIKit

extension UIView {
    func bindFrameToSuperviewBounds() {
        guard let superview = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        var constraints: [NSLayoutConstraint] = []
        constraints.append(NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: superview, attribute: .width, multiplier: 1, constant: 0))
        constraints.append(NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: superview, attribute: .height, multiplier: 1, constant: 0))
        constraints.append(NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: superview, attribute: .centerX, multiplier: 1, constant: 0))
        constraints.append(NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: superview, attribute: .centerY, multiplier: 1, constant: 0))
        superview.addConstraints(constraints)
    }
    
    func setupRoundedCorners(radius: CGFloat, corners: UIRectCorner) {
        layer.masksToBounds = true
        var cornerMask = CACornerMask()
        if(corners.contains(.topLeft)) {
            cornerMask.insert(.layerMinXMinYCorner)
        }
        if(corners.contains(.topRight)) {
            cornerMask.insert(.layerMaxXMinYCorner)
        }
        if(corners.contains(.bottomLeft)) {
            cornerMask.insert(.layerMinXMaxYCorner)
        }
        if(corners.contains(.bottomRight)) {
            cornerMask.insert(.layerMaxXMaxYCorner)
        }
        layer.cornerRadius = radius
        layer.maskedCorners = cornerMask
    }
}
