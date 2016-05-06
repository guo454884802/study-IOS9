//
//  protocolFile.swift
//  weatherData
//
//  Created by  wj on 15/10/31.
//  Copyright © 2015年 gzq. All rights reserved.
//

import Foundation

protocol Subject{
    func registerObserver(o:Observer)
    
    
    // func removeObserver(o:Observer)
    
    
    func notifyObserver()
    
    
}

protocol Observer{
    func update(temp:Double,humidity:Double,pressure:Double)
}

protocol DisplayElement{
    func display()
}
