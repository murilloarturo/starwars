//
//  TripViewModel.swift
//  RebellionTrips
//
//  Created by Arturo on 9/1/19.
//  Copyright © 2019 AM. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class TripViewModel {
    private let trip: Trip
    private let dataSubject = BehaviorSubject<[Any]>(value: [])
    private let headerSubject = BehaviorSubject<TripHeaderSection?>(value: nil)
    var data: Driver<[Any]> {
        return dataSubject.asDriver(onErrorJustReturn: [])
    }
    var header: Driver<TripHeaderSection> {
        return headerSubject.asDriver(onErrorJustReturn: nil).flatMap { value in value.map { .just($0) } ?? .empty() }
    }
    
    init(trip: Trip) {
        self.trip = trip
        
        updateData()
    }
}

private extension TripViewModel {
    func updateData() {
        headerSubject.onNext(headerSection())
        var items: [Any] = []
        items.append(contentsOf: detailSections())
        items.append(ratingSection())
        dataSubject.onNext(items)
    }
    
    func headerSection() -> TripHeaderSection {
        let pilot = trip.pilot
        let name = pilot.name.replacingOccurrences(of: " ", with: "\n")
        return TripHeaderSection(pilotImage: pilot.avatarURL,
                                 pilotName: name,
                                 originImage: trip.pickUp.imageURL,
                                 destinationImage: trip.dropOff.imageURL)
    }
    
    func detailSections() -> [TripDetailSection] {
        return [eventDetail(header: LocalizableString.departure.localized, event: trip.pickUp),
                eventDetail(header: LocalizableString.arrival.localized, event: trip.dropOff),
                distanceDetail(),
                durationDetail()]
    }
    
    func eventDetail(header: String, event: TripEvent) -> TripDetailSection {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm aa"
        return TripDetailSection(header: header,
                                 title: event.planet,
                                 extra: formatter.string(from: event.date))
    }
    
    func distanceDetail() -> TripDetailSection {
        let distance = trip.distance
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 3
        let value = "\(numberFormatter.string(from: NSNumber(value: distance.value)) ?? "") \(distance.unit.uppercased())"
        return TripDetailSection(header: LocalizableString.distance.localized,
                                 title: value, extra: nil)
    }
    
    func durationDetail() -> TripDetailSection {
        let timeInterval = TimeInterval(trip.duration)
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = timeInterval > 86400 ? [.day, .hour, .minute, .second] : (timeInterval > 3600 ? [.hour, .minute, .second] : [.minute, .second])
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        let duration = formatter.string(from: timeInterval) ?? ""
        return TripDetailSection(header: LocalizableString.duration.localized,
                                 title: duration, extra: nil)
    }
    
    func ratingSection() -> TripRatingSection {
        let pilot = trip.pilot
        return TripRatingSection(header: LocalizableString.rating.localized,
                                 title: LocalizableString.noRating.localized,
                                 rating: pilot.hasRating ? pilot.rating : nil)
    }
}
