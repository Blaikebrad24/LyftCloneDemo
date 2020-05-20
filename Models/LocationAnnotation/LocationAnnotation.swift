//
//  LocationAnnotation.swift
//  LyftClone
//
//  Created by Blaike Bradford on 5/19/20.
//  Copyright © 2020 Blaike Bradford. All rights reserved.
//

import UIKit
import MapKit

class LocationAnnotation: NSObject, MKAnnotation{
    var coordinate: CLLocationCoordinate2D
    let locationType: String
    
     init(coordinate: CLLocationCoordinate2D, locationType: String)
    {
        self.coordinate = coordinate
        self.locationType = locationType
    }
}
