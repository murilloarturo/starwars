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

class HomeViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    private let viewModel: HomeViewModel
    private let disposeBag = DisposeBag()
    
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
}

private extension HomeViewController {
    func setup() {
        title = LocalizableString.lastTrips.localized.uppercased()
        bind()
        viewModel.fetchTrips()
    }
    
    func bind() {
        viewModel
            .trips
            .drive(onNext: { [weak self] (trips) in
                self?.label.text = "\(trips.count)"
            })
            .disposed(by: disposeBag)
    }
}
