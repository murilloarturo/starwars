//
//  RatingView.swift
//  RebellionTrips
//
//  Created by Arturo on 9/1/19.
//  Copyright © 2019 AM. All rights reserved.
//

import UIKit

class RatingView: XibView {
    @IBOutlet private var starViews: [StarView]!
    
    func update(rating: Float) {
        let maxStars = starViews.count
        let numberParts = modf(rating)
        let numberOfStars = Int(numberParts.0)
        let decimalStars = numberParts.1
        guard rating > 0 && rating <= Float(maxStars) else { return }
        var index = 0
        while index < numberOfStars {
            starViews[index].fill(percentage: 1, animated: true)
            index += 1
        }
        if index < maxStars {
            starViews[index].fill(percentage: decimalStars, animated: true)
        }
    }
}
