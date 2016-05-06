//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

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

class WeatherData: Subject {
    var observers:[Observer] = []
    var temperature :Double?
    var humidity:Double?
    var pressure:Double?
    
    func registerObserver(o: Observer) {
        observers.append(o)
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
    }

}
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
        print("Current conditions:\(temperature) , F degrees and \(humidity)% humidity")
    }
}
var weatherData = WeatherData()
let currentDisplay = CurrentConditionsDisplay(weatherData: weatherData)
weatherData.setMeasurements(80, humidity: 65, pressure: 30.4)
