//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

struct FlyBehavior {
    func flyWithWing(){
        print("我会飞")
    }
    func flyNoWay(){
        print("我不会飞")
    }
}
struct QuackBehavior {
    func quack(){
        print("呱呱叫")
    }
    func squeak(){
        print("吱吱叫")
    }
    func muteQuack(){
        print("不会叫")
    }
}
class Duck {
    var flyBehavior = FlyBehavior()
    var quackBehavior = QuackBehavior()
    func swim(){
        print("慢慢游")
    }
    func display(){
        
    }
}
class ModelDuck:Duck{
    override func swim() {
        print("快快游")
    }
    override func display() {
        print("白色的")
    }
}

var model = ModelDuck()
model.display()
model.flyBehavior.flyWithWing()
model.swim()
model.quackBehavior.quack()



