//
//  ViewController.swift
//  Graphics
//
//  Created by  wj on 15/11/11.
//  Copyright © 2015年 gzq. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(true, animated:true)
        
        
//        Fonts()
//        drawRect()
//        
        // Do any additional setup after loading the view, typically from a nib.
    }
    func Fonts(){
        for familyName in UIFont.familyNames(){
            print("Font Family = \(familyName)")
            
            for fontName in UIFont.fontNamesForFamilyName(familyName){
                print("\(fontName)")
            }
        }
    }
    func drawRect() {
        // Drawing code
        let xcodeIcon = UIImage(named: "111")
        xcodeIcon?.drawAtPoint(CGPoint(x: 0, y: 20))
        xcodeIcon?.drawInRect(CGRect(x: 50, y: 10, width: 40, height: 35))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

