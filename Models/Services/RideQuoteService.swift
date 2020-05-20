//
//  RideQuoteService.swift
//  LyftClone
//
//  Created by Blaike Bradford on 5/10/20.
//  Copyright © 2020 Blaike Bradford. All rights reserved.
//

import Foundation
import CoreLocation

class RideQuoteService {
    
    static let shared = RideQuoteService()
    
    private init(){}
    
    func getQuote(pickupLocation: Location, dropoffLocation: Location) -> [RideQuote]
    {
        //convert each location object into a CLLocation Type
        let location1 = CLLocation(latitude: pickupLocation.latitude, longitude: pickupLocation.longitude)
        let location2 = CLLocation(latitude: dropoffLocation.latitude, longitude: dropoffLocation.longitude)
        //CLLocation has a method called Distance..will give you the distance between 2 objects
        let distance = location1.distance(from: location2)
        //set a minimum amount so drivers to encourage drivers to take short rides
        let minimumAmount = 3.0
        
        return [
            RideQuote(thumbnail: "ride-shared", name: "Shared", capacity: "1-2", price: minimumAmount + (distance * 0.5), time: Date()),
            RideQuote(thumbnail: "ride-compact", name: "Shared", capacity: "4", price: minimumAmount + (distance * 0.9), time: Date()),
            RideQuote(thumbnail: "ride-large", name: "Shared", capacity: "6", price: minimumAmount + (distance * 1.5), time: Date())
                ]
    
        
    }
}
