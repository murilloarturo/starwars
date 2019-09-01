//
//  HomeViewModel.swift
//  RebellionTrips
//
//  Created by Arturo on 9/1/19.
//  Copyright © 2019 AM. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class HomeViewModel {
    private let disposeBag = DisposeBag()
    private let service: HomeService
    private let tripsSubject = BehaviorSubject<[Trip]>(value: [])
    var trips: Driver<[Trip]> {
        return tripsSubject.asDriver(onErrorJustReturn: [])
    }
    var error = PublishSubject<Error>()
    
    init(service: HomeService) {
        self.service = service
    }
    
    func fetchTrips() {
        service
            .fetchTrips()
            .subscribe(onSuccess: { [weak self] (trips) in
                self?.tripsSubject.onNext(trips)
            }) { (error) in
                self.error.onNext(error)
            }
            .disposed(by: disposeBag)
    }
}
