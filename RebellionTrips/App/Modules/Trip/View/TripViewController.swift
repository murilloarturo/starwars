//
//  TripViewController.swift
//  RebellionTrips
//
//  Created by Arturo on 9/1/19.
//  Copyright © 2019 AM. All rights reserved.
//

import UIKit
import RxSwift

class TripViewController: UIViewController {
    @IBOutlet private weak var pilotImageView: UIImageView!
    @IBOutlet private weak var pilotNameLabel: UILabel! {
        didSet {
            pilotNameLabel.font = AppStyle.font(type: .header1)
            pilotNameLabel.textColor = .white
        }
    }
    @IBOutlet private weak var pilotContainerView: UIView! {
        didSet {
            pilotContainerView.setupRoundedCorners(radius: 20, corners: [.topLeft, .topRight])
            let blur = UIBlurEffect(style: .dark)
            let blurView = UIVisualEffectView(effect: blur)
            pilotContainerView.insertSubview(blurView, at: 0)
            blurView.bindFrameToSuperviewBounds()
        }
    }
    @IBOutlet private weak var originImageView: UIImageView!
    @IBOutlet private weak var destinationImageView: UIImageView!
    @IBOutlet private weak var collectionView: UICollectionView!
    private let dataSource = TripDataSource()
    private let disposeBag = DisposeBag()
    private let viewModel: TripViewModel
    
    init(viewModel: TripViewModel) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: TripViewController.self), bundle: Bundle.main)
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
        
        navigation?.setNavigationColor(.clear)
    }
}

extension TripViewController {
    func setup() {
        customBackButton()
        dataSource.collectionView = collectionView
        viewModel
            .data
            .drive(onNext: { [weak self] (sections) in
                self?.dataSource.sections = sections
            })
            .disposed(by: disposeBag)
        viewModel
            .header
            .drive(onNext: { [weak self] (header) in
                self?.update(header: header)
            })
            .disposed(by: disposeBag)
    }
    
    func update(header: TripHeaderSection) {
        let name = header.pilotName.uppercased()
        let string = NSMutableAttributedString(string: name, attributes: [.kern: 10,
                                                                          .font: AppStyle.font(type: .header1),
                                                                          .foregroundColor: UIColor.white])
        pilotNameLabel.attributedText = string
        if let url = header.pilotImage {
            pilotImageView.download(url: url)
        }
        if let url = header.destinationImage {
            destinationImageView.download(url: url)
        }
        if let url = header.originImage {
            originImageView.download(url: url)
        }
    }
}
