//
//  beverageFile.swift
//  装饰者模式
//
//  Created by  wj on 15/11/2.
//  Copyright © 2015年 gzq. All rights reserved.
//

import Foundation

class Beverage{
    var description :String{
        return ""
    }
    
    func getDescription() -> String{
        return description
    }
    
    func cost() -> Double{
        return 0
    }
    var setSize:String{
        return ""
    }
       func getSize() -> String{
        return setSize
    }
    
}
class Espresso:Beverage{
    override var description:String{
        return super.description + "Espresso"
    }
    init(setSize:String){
    var setSize:String{
        return super.setSize + setSize
        }}
    override func cost() -> Double {
        return 1.99
    }
}
class HouseBlend:Beverage {
    override var description:String{
        return super.description + "HouseBlend"
    }
    override func cost() -> Double {
        return 0.89
    }
}
class DarkRoast:Beverage{
    override var description:String{
        return super.description + "DarkRoast"
    }
    override func cost() -> Double {
        return 0.99
    }
}
class Decat:Beverage{
    override var description:String{
        return super.description + "Beverage"
    }
    override func cost() -> Double {
        return 1.05
    }
}
class Mocha:Beverage{
    var beverage:Beverage
    init(beverage:Beverage){
        self.beverage = beverage
    }
    override func getDescription() -> String {
        return beverage.getDescription() + "Mocha"
    }
    override func cost() -> Double {
        return 0.2 + beverage.cost()
    }
}
class Soy:Beverage{
    var beverage:Beverage
    init(beverage:Beverage){
        self.beverage = beverage
    }
    override func getSize() -> String {
        return beverage.setSize
    }
    override func getDescription() -> String {
        return beverage.getDescription() + "Soy"
    }
    override func cost() -> Double {
        var cost =  0.15 + beverage.cost()
        if (self.getSize() == "TALL"){
            cost += 0.1
        }else if self.getSize() == "GRANDE"{
            cost += 0.15
        }else if self.getSize() == "VENTI"{
            cost += 0.2
        }
        return cost
    }
        
}
class Whip:Beverage{
    var beverage:Beverage
    init(beverage:Beverage){
        self.beverage = beverage
    }
    override func getDescription() -> String {
        return beverage.getDescription() + "Whip"
    }
    override func cost() -> Double {
        return beverage.cost() + 0.1
    }
}

