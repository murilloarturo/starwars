//
//  HomeViewController.swift
//  RebellionTrips
//
//  Created by Arturo on 9/1/19.
//  Copyright © 2019 AM. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
}

private extension HomeViewController {
    func setup() {
        title = LocalizableString.lastTrips.localized.uppercased()
        customNavigation()
    }
}
