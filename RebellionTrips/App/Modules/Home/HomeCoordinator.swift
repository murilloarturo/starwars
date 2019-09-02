//
//  HomeCoordinator.swift
//  RebellionTrips
//
//  Created by Arturo on 9/1/19.
//  Copyright © 2019 AM. All rights reserved.
//

import UIKit
import RxSwift

final class HomeCoordinator: NSObject, Coordinator {
    private let disposeBag = DisposeBag()
    var childs = [Coordinator]()
    var navigation: UINavigationController?
    weak var window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        let viewController = homeViewController()
        navigation = BaseNavigationController(rootViewController: viewController)
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
    }
}

private extension HomeCoordinator {
    func homeViewController() -> UIViewController {
        let client = ServiceClient<Trip>()
        let service = HomeService(client: client)
        let viewModel = HomeViewModel(service: service)
        let viewController = HomeViewController(viewModel: viewModel)
        viewController
            .action
            .subscribeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] (action) in
                self?.handle(action: action)
            })
            .disposed(by: disposeBag)
        
        return viewController
    }
    
    func handle(action: HomeAction) {
        switch action {
        case .show(let trip):
            show(trip: trip)
        }
    }
    
    func show(trip: Trip) {
        let viewModel = TripViewModel(trip: trip)
        let viewController = TripViewController(viewModel: viewModel)
        navigation?.pushViewController(viewController, animated: true)
    }
}
