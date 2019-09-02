//
//  Coordinator.swift
//  RebellionTrips
//
//  Created by Arturo on 9/1/19.
//  Copyright © 2019 AM. All rights reserved.
//

import UIKit

protocol Coordinator {
    var childs: [Coordinator] { get set }
    var navigation: UINavigationController? { get set }
    
    func start()
}
