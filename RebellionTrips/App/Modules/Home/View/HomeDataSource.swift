//
//  HomeDataSource.swift
//  RebellionTrips
//
//  Created by Arturo on 9/1/19.
//  Copyright © 2019 AM. All rights reserved.
//

import UIKit

final class HomeDataSource: NSObject {
    weak var collectionView: UICollectionView? {
        didSet {
            setupCollectionView()
        }
    }
    var trips: [Trip] = [] {
        didSet {
            collectionView?.reloadData()
        }
    }
}

private extension HomeDataSource {
    func setupCollectionView() {
        guard let collectionView = collectionView else { return }
        collectionView.registerNibForCell(with: TripCell.self)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension HomeDataSource: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trips.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(with: TripCell.self, forIndexPath: indexPath)
        cell.update(with: trips[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension HomeDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let trip = trips[indexPath.row]
        return CGSize(width: collectionView.bounds.width, height: trip.pilot.hasRating ? 100 : 88)
    }
}
