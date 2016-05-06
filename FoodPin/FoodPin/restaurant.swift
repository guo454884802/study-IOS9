//
//  restaurant.swift
//  FoodPin
//
//  Created by  wj on 15/10/13.
//  Copyright © 2015年 gzq. All rights reserved.
//

import Foundation

class Restaurant{
    var name = ""
    var location = ""
    var type = ""
    var image = ""
    var phoneNumber = ""
    var isVisited = false
    var rating = ""
    init(name:String,location:String,type:String,image:String,phoneNumber:String,isVisited:Bool){
        self.name = name
        self.location = location
        self.type = type
        self.image = image
        self.phoneNumber = phoneNumber
        self.isVisited = isVisited
    }
}
