//
//  ViewController.swift
//  装饰者模式
//
//  Created by  wj on 15/11/2.
//  Copyright © 2015年 gzq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let beverage = Espresso(setSize: "TALL")
        let beverage01 = Soy(beverage: beverage)
        print("\(beverage01.getDescription()) $ \(beverage01.cost())")
        
        let beverage1 = DarkRoast()
        let beverage12 = Mocha(beverage: beverage1)
        let beverage13 = Mocha(beverage: beverage12)
        let beverage14 = Whip(beverage: beverage13)
        print("\(beverage14.getDescription()) $ \(beverage14.cost())")
        
        
        let beverage2 = HouseBlend()
        let beverage21 = Soy(beverage: beverage2)
        let beverage22 = Mocha(beverage: beverage21)
        let beverage23 = Whip(beverage: beverage22)
        print("\(beverage23.getDescription()) $ \(beverage23.cost())")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

