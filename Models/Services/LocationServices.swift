//
//  LocationServices.swift
//  LyftClone
//
//  Created by Blaike Bradford on 5/9/20.
//  Copyright © 2020 Blaike Bradford. All rights reserved.
//

import Foundation


class LocationServices{
    static let shared = LocationServices()
    
    private var recentlocations = [Location]()
    
    private init(){
        //load the data
        let locationsUrl = Bundle.main.url(forResource: "Locations", withExtension: "json")!
        let data = try! Data(contentsOf: locationsUrl)
        let decoder = JSONDecoder()
        recentlocations = try! decoder.decode([Location].self, from: data)
    }
    
    // to access private Location Array (recentLocations)
    func getRecentLocations() -> [Location]
    {
        return recentlocations
    }
}
