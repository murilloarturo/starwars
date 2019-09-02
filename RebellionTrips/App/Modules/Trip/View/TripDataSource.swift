//
//  TripDataSource.swift
//  RebellionTrips
//
//  Created by Arturo on 9/1/19.
//  Copyright © 2019 AM. All rights reserved.
//

import UIKit

final class TripDataSource: NSObject {
    weak var collectionView: UICollectionView? {
        didSet {
            setupCollectionView()
        }
    }
    var sections: [Any] = [] {
        didSet {
            collectionView?.reloadData()
        }
    }
}

private extension TripDataSource {
    func setupCollectionView() {
        guard let collectionView = collectionView else { return }
        let layout = ColumnFlowLayout()
        collectionView.collectionViewLayout = layout
        collectionView.registerNibForCell(with: TripDetailCell.self)
        collectionView.registerNibForCell(with: RatingCell.self)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension TripDataSource: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = sections[indexPath.row]
        switch item {
        case let section as TripRatingSection:
            let cell = collectionView.dequeueReusableCell(with: RatingCell.self, forIndexPath: indexPath)
            cell.update(header: section.header, title: section.title, rating: section.rating)
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(with: TripDetailCell.self, forIndexPath: indexPath)
            if let section = item as? TripDetailSection {
                cell.update(header: section.header, title: section.title, extra: section.extra)
            }
            return cell
        }
    }
}

extension TripDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let item = sections[indexPath.row]
        let width = collectionView.bounds.width
        switch item {
        case is TripRatingSection:
            return CGSize(width: width, height: 100)
        case let section as TripDetailSection:
            let hasExtra = section.extra != nil
            return CGSize(width: (width / 2), height: hasExtra ? 100 : 85)
        default:
            return .zero
        }
    }
}
