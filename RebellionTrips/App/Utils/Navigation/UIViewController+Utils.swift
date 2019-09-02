//
//  UIViewController+Utils.swift
//  RebellionTrips
//
//  Created by Arturo on 9/1/19.
//  Copyright © 2019 AM. All rights reserved.
//

import UIKit

extension UIViewController {
    var navigation: BaseNavigationController? {
        return navigationController as? BaseNavigationController
    }
    
    func customBackButton() {
        let image = #imageLiteral(resourceName: "backIcon").withRenderingMode(.alwaysTemplate)
        let button = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(didTapBackButton))
        navigationItem.leftBarButtonItem = button
    }
    
    @objc private func didTapBackButton() {
        if let navigation = navigationController {
            navigation.popViewController(animated: true)
        } else {
            dismiss(animated: true)
        }
    }
}
