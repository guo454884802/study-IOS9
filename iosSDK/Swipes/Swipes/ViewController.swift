//
//  ViewController.swift
//  Swipes
//
//  Created by  wj on 16/1/29.
//  Copyright © 2016年 gzq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
 
    @IBOutlet weak var label: UILabel!
    private var gestureStartPoint:CGPoint!
    
//    private let minimumGestureLength = Float(25.0)
//    private let maximumVariance = Float(5)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        for var touchCount = 1;touchCount <= 5;touchCount++ {
            let vertical = UISwipeGestureRecognizer(target: self, action: "reportVerticalSwipe:")
            vertical.direction = [.Up,.Down]
            vertical.numberOfTouchesRequired = touchCount
            view.addGestureRecognizer(vertical)
        
            let horizontal = UISwipeGestureRecognizer(target: self, action: "reportHorizontalSwipe:")
            horizontal.direction = [.Left,.Right]
            horizontal.numberOfTouchesRequired = touchCount
            view.addGestureRecognizer(horizontal)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//
//    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        let touch = (touches as NSSet).anyObject() as! UITouch
//        gestureStartPoint = touch.locationInView(self.view)
//    }
//    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        let touch = (touches as NSSet).anyObject() as! UITouch
//        let currentPosition = touch.locationInView(self.view)
//        
//        let deltaX = fabsf(Float(gestureStartPoint.x - currentPosition.x))
//        let deltaY = fabsf(Float(gestureStartPoint.y - currentPosition.y))
//        if deltaX >= minimumGestureLength && deltaY <= maximumVariance{
//            label.text = "察觉到水平滑动"
//            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), { () -> Void in
//                self.label.text = " "
//            })
//        }else if deltaY >= minimumGestureLength && deltaX <= maximumVariance {
//            label.text = "察觉到垂直滑动"
//            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), { () -> Void in
//                self.label.text = " "
//            })
//        }
//    }
    func descriptionForTouchCount(touchCount:Int) -> String{
        switch touchCount{
        case 1:
            return "Single"
        case 2:
            return "Double"
        case 3:
            return "Triple"
        case 4:
            return "Quadruple"
        case 5:
            return "Quintuple"
        default:
            return ""
        }
    }
    
    func reportHorizontalSwipe(recognizer:UIGestureRecognizer){
        let count = descriptionForTouchCount(recognizer.numberOfTouches())
        label.text = "\(count)个水平滑动被察觉"
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), { () -> Void in
            self.label.text = " "
        })
    }
    
    func reportVerticalSwipe(recognizer:UIGestureRecognizer){
        let count = descriptionForTouchCount(recognizer.numberOfTouches())
        label.text = "\(count)个垂直滑动被察觉"
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(2 * NSEC_PER_SEC)), dispatch_get_main_queue()) { () -> Void in
            self.label.text = " "
        }
    }
}

