//
//  RatingCell.swift
//  RebellionTrips
//
//  Created by Arturo on 9/1/19.
//  Copyright © 2019 AM. All rights reserved.
//

import UIKit

class RatingCell: UICollectionViewCell {
    @IBOutlet private weak var headerLabel: UILabel!{
        didSet {
            headerLabel.font = AppStyle.font(type: .subtitle)
            headerLabel.textColor = AppStyle.palette.grey
        }
    }
    @IBOutlet private weak var titleLabel: UILabel! {
        didSet {
            headerLabel.font = AppStyle.font(type: .title)
            headerLabel.textColor = AppStyle.palette.grey
        }
    }
    @IBOutlet private weak var ratingView: RatingView!
    @IBOutlet private weak var ratingHeightConstraint: NSLayoutConstraint!
    
    func update(header: String, title: String, rating: Float?) {
        headerLabel.text = header.capitalized
        if let rating = rating {
            titleLabel.text = nil
            ratingHeightConstraint.constant = 40
            ratingView.update(rating: rating)
        } else {
            titleLabel.text = title.uppercased()
            ratingHeightConstraint.constant = 0
        }
    }
}
