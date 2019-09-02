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
    
    func presentAlert(title: String,  message: String, buttonTitle: String, handler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: buttonTitle, style: UIAlertAction.Style.default, handler: handler)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
