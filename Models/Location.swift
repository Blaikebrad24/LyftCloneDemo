//
//  Location.swift
//  LyftClone
//
//  Created by Blaike Bradford on 5/9/20.
//  Copyright © 2020 Blaike Bradford. All rights reserved.
//

import Foundation

//Needs to conform to the Codable protocol
class Location: Codable{
    var title: String
    var subtitle: String
    let latitude: Double
    let longitude: Double
    
    init(title: String, subtitle: String, latitude: Double, longitude: Double)
    {
        self.title = title
        self.subtitle = subtitle
        self.latitude = latitude
        self.longitude = longitude
    }
}
