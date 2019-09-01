//
//  UIViewController+Utils.swift
//  RebellionTrips
//
//  Created by Arturo on 9/1/19.
//  Copyright © 2019 AM. All rights reserved.
//

import UIKit

extension UIViewController {
    func customNavigation() {
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = UIColor.black.withAlphaComponent(0.9)
        navigationController?.navigationBar.backgroundColor = .black
        navigationController?.view.backgroundColor = .black
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white,
                                                                   .font: AppStyle.font(type: .bigTitle)]
    }
    
    func customBackButton() {
        let image = #imageLiteral(resourceName: "backArrow").withRenderingMode(.alwaysTemplate)
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
