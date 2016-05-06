//
//  File.swift
//  工厂模式
//
//  Created by  wj on 15/11/4.
//  Copyright © 2015年 gzq. All rights reserved.
//

import Foundation

protocol Pizza{
    func prepare()
    func bake()
    func cut()
    func box()
}

class PizzaStore {
    func createPizza(type:String) -> Pizza?{
     return nil
    }
    func orderPizza(type:String) -> Pizza{
       let pizza = createPizza(type)
        
        pizza?.prepare()
        pizza?.bake()
        pizza?.cut()
        pizza?.box()
    
        return pizza!
    }
}
class NYPizzaStore:PizzaStore{
    override func createPizza(type: String) -> Pizza? {
        if type == "cheese"{
            return 
        }
    }
}