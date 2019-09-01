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
        
        setNavigationBarHidden(false, animated: true)
        navigationBar.isTranslucent = false
        navigationBar.barTintColor = UIColor.black.withAlphaComponent(0.9)
        navigationBar.backgroundColor = .black
        view.backgroundColor = .black
        navigationBar.tintColor = .white
        navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white,
                                                                   .font: AppStyle.font(type: .bigTitle)]
    }
}
