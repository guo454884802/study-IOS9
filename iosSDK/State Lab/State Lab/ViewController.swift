//
//  ViewController.swift
//  State Lab
//
//  Created by  wj on 16/1/25.
//  Copyright © 2016年 gzq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var label:UILabel!
    private var smiley:UIImage!
    private var smileyView:UIImageView!
    private var segmentedControl:UISegmentedControl!
    private var index = 0
    private var animate = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bounds = view.bounds
        let labelFrame = CGRectMake(bounds.origin.x, CGRectGetMidY(bounds) - 50, bounds.size.width, 70)
        label = UILabel(frame: labelFrame)
        label.font = UIFont(name: "Helvetica", size: 70)
        label.text = "郭志强"
        label.textAlignment = NSTextAlignment.Center
        label.backgroundColor = UIColor.clearColor()
        
        let smileyFrame = CGRectMake(CGRectGetMidX(bounds) - 42, CGRectGetMidY(bounds) / 2 - 42, 84, 84)
        smileyView = UIImageView(frame: smileyFrame)
        smileyView.contentMode = UIViewContentMode.Center
        let smileyPath = NSBundle.mainBundle().pathForResource("smiley", ofType: "png")!
        smiley = UIImage(contentsOfFile: smileyPath)
        smileyView.image = smiley
        
        segmentedControl = UISegmentedControl(items: ["One","Two","Three","Four"])
        segmentedControl.frame = CGRectMake(bounds.origin.x + 20, 50, bounds.size.width - 40, 30)
        segmentedControl.addTarget(self, action: "selectionChanged:", forControlEvents: .ValueChanged)
        
        view.addSubview(segmentedControl)
        
        view.addSubview(smileyView)
        
        view.addSubview(label)
        
        index = NSUserDefaults.standardUserDefaults().integerForKey("index")
        segmentedControl.selectedSegmentIndex = index
        
        let center = NSNotificationCenter.defaultCenter()
        center.addObserver(self, selector: "applicationWillResignActive", name: UIApplicationWillResignActiveNotification, object: nil)
        center.addObserver(self, selector: "applicationDidBecomeActive", name: UIApplicationDidBecomeActiveNotification, object: nil)
        center.addObserver(self, selector: "applicationDidEnterBackground", name: UIApplicationDidEnterBackgroundNotification, object: nil)
//        center.addObserver(self, selector: "applicationWillEnterForeground", name: UIApplicationWillEnterForegroundNotification, object: nil)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func rotateLabelDown(){
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.label.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
            }) { (bool) -> Void in
                self.rotateLabelUp()
        }
    }
    func rotateLabelUp(){
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.label.transform = CGAffineTransformMakeRotation(0)
            }) { (bool) -> Void in
                if self.animate {
                    self.rotateLabelDown()
                }
        }
    }
    func applicationWillResignActive(){
        print("VC:\(__FUNCTION__)")
        animate = false
    }
    func applicationDidBecomeActive(){
        print("VC:\(__FUNCTION__)")
        animate = true
        rotateLabelDown()
    }
    func applicationDidEnterBackground(){
        print("VC:\(__FUNCTION__)")
//        self.smiley = nil
//        self.smileyView.image = nil
        
        NSUserDefaults.standardUserDefaults().setInteger(self.index, forKey: "index")
        
        let app = UIApplication.sharedApplication()
        var taskId = UIBackgroundTaskInvalid
        let id = app.beginBackgroundTaskWithExpirationHandler { () -> Void in
            print("后台工作耗尽时间，将被终止")
            app.endBackgroundTask(taskId)
        }
        taskId = id
        
        if taskId == UIBackgroundTaskInvalid{
            print("未能开始背景工作")
            return
        }
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { () -> Void in
            print("开始后台工作" + "\(app.backgroundTimeRemaining) seconds remaining")
            
            self.smiley = nil
            self.smileyView.image = nil
            
            NSThread.sleepForTimeInterval(25)
            
            print("完成后台工作" + "\(app.backgroundTimeRemaining) seconds remaining")
            app.endBackgroundTask(taskId)
        }
    }
    func selectionChanged(sender:UISegmentedControl){
        index = segmentedControl.selectedSegmentIndex
    }
//    func applicationWillEnterForeground(){
//        print("VC:\(__FUNCTION__)")
//         let smileyPath = NSBundle.mainBundle().pathForResource("smiley", ofType: "png")!
//        self.smiley = UIImage(contentsOfFile: smileyPath)
//        self.smileyView.image = smiley
//    }
}

