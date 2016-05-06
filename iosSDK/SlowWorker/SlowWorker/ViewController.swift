//
//  ViewController.swift
//  SlowWorker
//
//  Created by  wj on 16/1/25.
//  Copyright © 2016年 gzq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var startButton:UIButton!
    @IBOutlet var resultsTextView:UITextView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be hud.show(true)
        hud.hide(true, afterDelay: 1).
    }
    func fetchSomethingFromServer() -> String{
        NSThread.sleepForTimeInterval(1)
        return "Hi there"
    }
    func processData(data:String) -> String{
        NSThread.sleepForTimeInterval(2)
        return data.uppercaseString
    }
    func calulateFirstResult(data:String) -> String{
        NSThread.sleepForTimeInterval(3)
        return "Number of chars: \(data.characters.count)"
    }
    func calulateSecondResult(data:String) -> String{
        NSThread.sleepForTimeInterval(2)
        return data.stringByReplacingOccurrencesOfString("E", withString: "e")
    }
    @IBAction func doWork(sender:AnyObject){
        let startTime = NSDate()
        self.resultsTextView.text = ""
        startButton.enabled = false
        spinner.startAnimating()
        
        let queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
        dispatch_async(queue) { () -> Void in
            let fetchedData = self.fetchSomethingFromServer()
            let processedData = self.processData(fetchedData)
//            let firstResult = self.calulateFirstResult(processedData)
//            print(firstResult)
//            let secondResult = self.calulateSecondResult(processedData)
//            print(secondResult)
            var firstResult:String!
            var secondResult:String!
            let group = dispatch_group_create()
            
            dispatch_group_async(group, queue, { () -> Void in
                firstResult = self.calulateFirstResult(processedData)
                print(firstResult)
            })
            dispatch_group_async(group, queue, { () -> Void in
                secondResult = self.calulateSecondResult(processedData)
                print(secondResult)
            })
            dispatch_group_notify(group, queue, { () -> Void in
                let resultsSummary = "First:[\(firstResult)]\n Second:[\(secondResult)]"
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.resultsTextView.text = resultsSummary
                    self.startButton.enabled = true
                    self.spinner.stopAnimating()
                })

            })
            let endTime = NSDate()
            print("Completed in \(endTime.timeIntervalSinceDate(startTime)) seconds")
        }
        
    }

    @IBAction func text(sender: UIButton) {
        let alert = UIAlertController(title: "郭志强", message: "lalala", preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
        alert.addAction(action)
        self.presentViewController(alert, animated: true, completion: nil)
    }
}

