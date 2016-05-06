//
//  File.swift
//  weatherData
//
//  Created by  wj on 15/10/31.
//  Copyright © 2015年 gzq. All rights reserved.
//

import Foundation

class CurrentConditionsDisplay: Observer,DisplayElement {
    var temperature:Double?
    var humidity:Double?
    var weatherData:Subject
    
    init(weatherData:Subject){
        self.weatherData = weatherData
        weatherData.registerObserver(self)
    }
    
    func update(temp: Double, humidity: Double, pressure: Double) {
        self.temperature = temp
        self.humidity = humidity
        display()
    }
    func display() {
        print("Current conditions:\(temperature)F degrees and \(humidity)% humidity")
    }
}
