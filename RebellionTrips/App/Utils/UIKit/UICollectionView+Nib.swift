//
//  UICollectionView+Nib.swift
//  RebellionTrips
//
//  Created by Arturo on 9/1/19.
//  Copyright © 2019 AM. All rights reserved.
//

import UIKit

extension UICollectionView {
    public func registerNibForCell<T: UICollectionViewCell>(with cellType: T.Type) {
        register(UINib(nibName: String(describing: cellType), bundle: Bundle(for:T.classForCoder())), forCellWithReuseIdentifier: String(describing: cellType))
    }
    
    public func dequeueReusableCell<T: UICollectionViewCell>(with cellType: T.Type, forIndexPath indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: String(describing: cellType), for: indexPath) as! T
    }
}
