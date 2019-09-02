//
//  RebellionTripsTests.swift
//  RebellionTripsTests
//
//  Created by Arturo on 9/1/19.
//  Copyright © 2019 AM. All rights reserved.
//

import XCTest
import RxSwift
import RxTest
import RxBlocking
@testable import RebellionTrips

class RebellionTripsTests: XCTestCase {

    private let disposeBag = DisposeBag()
    
    override func setUp() { }

    override func tearDown() { }
    
    func testServiceClient() {
        do {
            let tripsClient = MockServiceClient(baseUrl: "trips")
            let trips = try tripsClient.requestElements(verb: .get, endpoint: "", parameters: nil).toBlocking().first()!
            XCTAssertEqual(trips.count, 7)
            
            let singleTripCilent = MockServiceClient(baseUrl: "trip")
            let trip = try singleTripCilent.requestElement(verb: .get, endpoint: "", parameters: nil).toBlocking().first()!
            XCTAssertEqual(trip.id, 6)
        } catch (let error) {
            XCTFail(error.localizedDescription)
        }
        
        let fileNotFoundClient = MockServiceClient(baseUrl: "posts")
        XCTAssertThrowsError(try fileNotFoundClient.requestElements(verb: .get, endpoint: "", parameters: nil).toBlocking().first())
        
        let wrongFileClient = MockServiceClient(baseUrl: "wrongTrip")
        XCTAssertThrowsError(try wrongFileClient.requestElement(verb: .get, endpoint: "", parameters: nil).toBlocking().first())
    }
    
    func testHomeViewModel() {
        let client = MockServiceClient()
        let service = HomeService(client: client)
        let model = HomeViewModel(service: service)
        do {
            let trips = try model.trips.toBlocking().first()!
            XCTAssertEqual(trips.count, 7)
            let firstTrip = trips[0]
            let pilot = firstTrip.pilot
            XCTAssertNil(pilot.avatarPath)
            XCTAssertNil(pilot.rating)
            let secondTrip = trips[1]
            let pickup = secondTrip.pickUp
            XCTAssertNil(pickup.planetImage)
            let lastTrip = trips[6]
            XCTAssertEqual(lastTrip.pilot.name, "General Grievous")
            XCTAssertEqual(lastTrip.duration, 19427)
        } catch (let error) {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testTripViewModel() {
        do {
            let singleTripCilent = MockServiceClient(baseUrl: "trip")
            let trip = try singleTripCilent.requestElement(verb: .get, endpoint: "", parameters: nil).toBlocking().first()!
            let tripViewModel = TripViewModel(trip: trip)
            let header = try tripViewModel.header.toBlocking().first()!
            XCTAssertEqual(header.pilotName, "General\nGrievous")
            XCTAssertNotNil(header.pilotImage)
            XCTAssertNotNil(header.destinationImage)
            XCTAssertNotNil(header.originImage)
            
            let data = try tripViewModel.data.toBlocking().first()!
            XCTAssertEqual(data.count, 5)
            let departure = data[0] as! TripDetailSection
            XCTAssertEqual(departure.header, "Departure")
            XCTAssertNotNil(departure.extra)
            XCTAssertEqual(departure.extra!, "09:12 AM")
            let arrival = data[1] as! TripDetailSection
            XCTAssertNotNil(arrival.extra)
            XCTAssertEqual(arrival.extra!, "14:35 PM")
            let distance = data[2] as! TripDetailSection
            XCTAssertEqual(distance.title, "2,478,572 KM")
            XCTAssertNil(distance.extra)
            let duration = data[3] as! TripDetailSection
            XCTAssertEqual(duration.title, "5:23:47")
            let rating = data[4] as! TripRatingSection
            XCTAssertNotNil(rating.rating)
        } catch (let error) {
            XCTFail(error.localizedDescription)
        }
    }
}
