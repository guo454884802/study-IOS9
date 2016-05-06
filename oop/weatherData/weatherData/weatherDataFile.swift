//
//  WeatherDataFile.swift
//  weatherData
//
//  Created by  wj on 15/10/31.
//  Copyright © 2015年 gzq. All rights reserved.
//

import Foundation


class WeatherData: Subject {
    var observers:[Observer] = []
    var temperature :Double?
    var humidity:Double?
    var pressure:Double?
    
    func registerObserver(o: Observer) {
        observers.append(o)
        print(observers)
    }
    func notifyObserver() {
        for i in 0..<observers.count{
            let observer = observers[i]
            observer.update(temperature!, humidity: humidity!, pressure: pressure!)
        }
    }
    func measurementsChanged(){
        notifyObserver()
    }
    func setMeasurements(temperature:Double,humidity:Double,pressure:Double){
        self.temperature = temperature
        self.humidity = humidity
        self.pressure = pressure
        measurementsChanged()
    }
    
}
