//
//  VehicleClass.swift
//  LyftClone
//
//  Created by Blaike Bradford on 5/16/20.
//  Copyright © 2020 Blaike Bradford. All rights reserved.
//

import MapKit
 

class VehicleClass: NSObject, MKAnnotation{
    
    var coordinate: CLLocationCoordinate2D
    
    init(coordinate: CLLocationCoordinate2D)
    {
        self.coordinate = coordinate
    }
}
