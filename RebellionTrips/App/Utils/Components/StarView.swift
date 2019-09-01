//
//  StarView.swift
//  RebellionTrips
//
//  Created by Arturo on 9/1/19.
//  Copyright © 2019 AM. All rights reserved.
//

import UIKit

class StarView: XibView {
    @IBOutlet private weak var emptyImageView: UIImageView!
    @IBOutlet private weak var filledImageView: UIImageView!
    @IBOutlet private weak var fillTraillingConstraint: NSLayoutConstraint!
    private var percentage: Float = 0
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let width = bounds.width
        let value = width - (CGFloat(percentage) * width)
        fillTraillingConstraint.constant = value
    }
    
    func fill(percentage: Float, animated: Bool) {
        self.percentage = percentage
    }
}
