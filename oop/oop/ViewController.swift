//
//  ViewController.swift
//  oop
//
//  Created by  wj on 15/10/27.
//  Copyright © 2015年 gzq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
var MiniDuck = Duck()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MiniDuck.flyBehavior.FlyWithWings()
        MiniDuck.quackBehavior.Squeak()

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

