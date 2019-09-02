//
//  TripCell.swift
//  RebellionTrips
//
//  Created by Arturo on 9/1/19.
//  Copyright © 2019 AM. All rights reserved.
//

import UIKit

class TripCell: UICollectionViewCell {
    @IBOutlet private weak var separatorView: UIView! {
        didSet {
            separatorView.backgroundColor = AppStyle.palette.grey
        }
    }
    @IBOutlet private weak var pilotImageView: UIImageView!
    @IBOutlet private weak var pilotNameLabel: UILabel! {
        didSet {
            pilotNameLabel.font = AppStyle.font(type: .title)
            pilotNameLabel.textColor = .white
        }
    }
    @IBOutlet private weak var fromLabel: UILabel! {
        didSet {
            fromLabel.font = AppStyle.font(type: .subtitle)
            fromLabel.textColor = AppStyle.palette.grey
        }
    }
    @IBOutlet private weak var toLabel: UILabel! {
        didSet {
            toLabel.font = AppStyle.font(type: .subtitle)
            toLabel.textColor = AppStyle.palette.grey
        }
    }
    @IBOutlet private weak var arrowImageView: UIImageView! {
        didSet {
            let image = #imageLiteral(resourceName: "arrowIcon")
            arrowImageView.image = image
        }
    }
    @IBOutlet private weak var ratingView: RatingView!
    @IBOutlet private weak var ratingHeightConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func update(with trip: Trip) {
        update(pilot: trip.pilot)
        update(pickUp: trip.pickUp)
        update(dropOff: trip.dropOff)
    }
}

private extension TripCell {
    func update(pilot: Pilot) {
        if let url = pilot.avatarURL {
            pilotImageView.download(url: url)
        }
        let name = pilot.name.uppercased()
        let string = NSMutableAttributedString(string: name, attributes: [.kern: 3,
                                                                          .font: AppStyle.font(type: .title),
                                                                          .foregroundColor: UIColor.white])
        pilotNameLabel.attributedText = string
        let hasRating = pilot.hasRating
        if hasRating {
            ratingHeightConstraint.constant = 25
            ratingView.update(rating: pilot.rating ?? 0)
        } else {
            ratingHeightConstraint.constant = 0
        }
    }
    
    func update(pickUp: TripEvent) {
        fromLabel.text = pickUp.planet
    }
    
    func update(dropOff: TripEvent) {
        toLabel.text = dropOff.planet
    }
}
