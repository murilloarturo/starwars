//
//  HomeModule.swift
//  RebellionTrips
//
//  Created by Arturo on 9/1/19.
//  Copyright © 2019 AM. All rights reserved.
//

import UIKit

final class HomeModule {
    func homeViewController() -> HomeViewController {
        let client = ServiceClient<Trip>()
        let service = HomeService(client: client)
        let viewModel = HomeViewModel(service: service)
        return HomeViewController(viewModel: viewModel)
    }
}
