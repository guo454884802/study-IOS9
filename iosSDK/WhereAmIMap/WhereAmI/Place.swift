//
//  Place.swift
//  WhereAmI
//
//  Created by  wj on 16/1/30.
//  Copyright © 2016年 gzq. All rights reserved.
//

import UIKit
import MapKit

class Place: NSObject,MKAnnotation {
    
    var title:String?
    var subtitle:String?
    var coordinate:CLLocationCoordinate2D
    
    init(title:String,subtitle:String,coordinate:CLLocationCoordinate2D){
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
}
