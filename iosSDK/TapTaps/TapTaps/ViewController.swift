//
//  ViewController.swift
//  TapTaps
//
//  Created by  wj on 16/1/29.
//  Copyright © 2016年 gzq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var singleLabel: UILabel!
    @IBOutlet weak var doubleLable: UILabel!
    @IBOutlet weak var tripeLabel: UILabel!
    @IBOutlet weak var quadrupleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let singleTap = UITapGestureRecognizer(target: self, action: "singleTap")
        singleTap.numberOfTapsRequired = 1
        singleTap.numberOfTouchesRequired = 1
        view.addGestureRecognizer(singleTap)
        
        let doubleTap = UITapGestureRecognizer(target: self, action: "doubleTap")
        doubleTap.numberOfTapsRequired = 2
        doubleTap.numberOfTouchesRequired = 1
        view.addGestureRecognizer(doubleTap)
        singleTap.requireGestureRecognizerToFail(doubleTap)
        
        let tripleTap = UITapGestureRecognizer(target: self, action: "tripleTap")
        tripleTap.numberOfTapsRequired = 3
        tripleTap.numberOfTouchesRequired = 1
        view.addGestureRecognizer(tripleTap)
        doubleTap.requireGestureRecognizerToFail(tripleTap)
        
        let quadrupleTap = UITapGestureRecognizer(target: self, action: "quadrupleTap")
        quadrupleTap.numberOfTapsRequired = 4
        quadrupleTap.numberOfTouchesRequired = 1
        view.addGestureRecognizer(quadrupleTap)
        tripleTap.requireGestureRecognizerToFail(quadrupleTap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func singleTap(){
        singleLabel.text = "Single 点击"
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(2 * NSEC_PER_SEC )),dispatch_get_main_queue()) { () -> Void in
            self.singleLabel.text = " "
        }
    }
    func doubleTap(){
        doubleLable.text = "Double 点击"
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(2 * NSEC_PER_SEC)), dispatch_get_main_queue()) { () -> Void in
            self.doubleLable.text = " "
        }
    }
    func tripleTap(){
        tripeLabel.text = "Triple 点击"
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(2 * NSEC_PER_SEC)), dispatch_get_main_queue()) { () -> Void in
            self.tripeLabel.text = " "
        }
    }
    func quadrupleTap(){
        quadrupleLabel.text = "Quadruple 点击"
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(2 * NSEC_PER_SEC)), dispatch_get_main_queue()) { () -> Void in
            self.quadrupleLabel.text = " "
        }
    }
}

