//
//  ViewController.swift
//  weatherData
//
//  Created by  wj on 15/10/31.
//  Copyright © 2015年 gzq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let weatherData = WeatherData()
        var currentDisplay = CurrentConditionsDisplay(weatherData: weatherData)
        weatherData.setMeasurements(80, humidity: 65, pressure: 30.4)
        weatherData.setMeasurements(82, humidity: 70, pressure: 29.2)

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

