//
//  BaseNavigationController.swift
//  RebellionTrips
//
//  Created by Arturo on 9/1/19.
//  Copyright © 2019 AM. All rights reserved.
//

import UIKit

final class BaseNavigationController: UINavigationController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
        view.backgroundColor = .clear
        navigationBar.backgroundColor = .clear
        navigationBar.tintColor = .white
        navigationBar.titleTextAttributes = [.kern: 3,
                                             .foregroundColor: UIColor.white,
                                             .font: AppStyle.font(type: .header2)]
    }
    
    func setNavigationColor(_ color: UIColor) {
        navigationBar.backgroundColor = color
    }
}
