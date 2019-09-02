//
//  TripDetailCell.swift
//  RebellionTrips
//
//  Created by Arturo on 9/1/19.
//  Copyright © 2019 AM. All rights reserved.
//

import UIKit

class TripDetailCell: UICollectionViewCell {
    @IBOutlet private weak var headerLabel: UILabel! {
        didSet {
            headerLabel.font = AppStyle.font(type: .subtitle)
            headerLabel.textColor = AppStyle.palette.grey
        }
    }
    @IBOutlet private weak var titleLabel: UILabel! {
        didSet {
            titleLabel.font = AppStyle.font(type: .title)
            titleLabel.textColor = .white
            titleLabel.adjustsFontSizeToFitWidth = true
            titleLabel.minimumScaleFactor = 0.2
        }
    }
    @IBOutlet private weak var extraLabel: UILabel! {
        didSet {
            extraLabel.font = AppStyle.font(type: .title)
            extraLabel.textColor = AppStyle.palette.grey
        }
    }
    
    func update(header: String, title: String, extra: String?) {
        headerLabel.text = header.capitalized
        let string = NSMutableAttributedString(string: title.uppercased(), attributes: [.kern: 3,
                                                                          .font: AppStyle.font(type: .title),
                                                                          .foregroundColor: UIColor.white])
        titleLabel.attributedText = string
        extraLabel.text = extra?.uppercased()
    }
}
