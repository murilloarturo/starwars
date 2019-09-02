//
//  HomeViewController.swift
//  RebellionTrips
//
//  Created by Arturo on 9/1/19.
//  Copyright © 2019 AM. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

enum HomeAction {
    case show(trip: Trip)
}

class HomeViewController: UIViewController {
    @IBOutlet private weak var collectionView: UICollectionView!
    private let viewModel: HomeViewModel
    private let dataSource = HomeDataSource()
    private let disposeBag = DisposeBag()
    var action: Observable<HomeAction> {
        return dataSource.actionSubject.asObservable()
    }
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: HomeViewController.self), bundle: Bundle.main)
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigation?.setNavigationColor(.black)
    }
}

private extension HomeViewController {
    func setup() {
        title = LocalizableString.lastTrips.localized.uppercased()
        dataSource.collectionView = collectionView
        bind()
        viewModel.fetchTrips()
    }
    
    func bind() {
        viewModel
            .trips
            .drive(onNext: { [weak self] (trips) in
                self?.dataSource.trips = trips
            })
            .disposed(by: disposeBag)
        
        viewModel
            .error
            .subscribeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] (error) in
                self?.presentAlert(title: LocalizableString.error.localized,
                                   message: LocalizableString.errorOccurred.localized,
                                   buttonTitle: LocalizableString.ok.localized.capitalized)
            })
            .disposed(by: disposeBag)
    }
}
