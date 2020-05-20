//
//  RideQuote.swift
//  LyftClone
//
//  Created by Blaike Bradford on 5/10/20.
//  Copyright © 2020 Blaike Bradford. All rights reserved.
//

import Foundation

class RideQuote {
    
    let thumbnail: String
    let name: String
    let capacity: String
    let price : Double
    let time : Date
    
    
    init(thumbnail: String, name: String, capacity: String, price: Double, time: Date) {
        self.thumbnail = thumbnail
        self.name = name
        self.capacity = name
        self.price = price
        self.time = time 
    }
}
