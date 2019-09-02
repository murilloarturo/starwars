//
//  TripDetails.swift
//  RebellionTrips
//
//  Created by Arturo on 9/1/19.
//  Copyright © 2019 AM. All rights reserved.
//

import Foundation

struct TripHeaderSection {
    var pilotImage: URL?
    var pilotName: String
    var originImage: URL?
    var destinationImage: URL?
}

struct TripDetailSection {
    var header: String
    var title: String
    var extra: String?
}

struct TripRatingSection {
    var header: String
    var title: String
    var rating: Float?
}
