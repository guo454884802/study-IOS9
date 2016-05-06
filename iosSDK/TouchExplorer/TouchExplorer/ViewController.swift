//
//  ViewController.swift
//  TouchExplorer
//
//  Created by  wj on 16/1/29.
//  Copyright © 2016年 gzq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var tapsLabel: UILabel!
    @IBOutlet weak var touchesLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateLabelsFromTouches(touches:Set<UITouch>){
        let touch = (touches as NSSet).anyObject() as! UITouch
        let numTaps = touch.tapCount
        let tapsMessage = "\(numTaps)次轻点"
        tapsLabel.text = tapsMessage
        
        let numTouches = touches.count
        let touchMsg = "\(numTouches)根手指"
        touchesLabel.text = touchMsg
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        messageLabel.text = "开始接触"
        updateLabelsFromTouches((event?.allTouches())!)
    }
    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        messageLabel.text = "触摸取消"
        updateLabelsFromTouches((event?.allTouches())!)
    }
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        messageLabel.text = "接触结束"
        updateLabelsFromTouches((event?.allTouches())!)
    }
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        messageLabel.text = "手势"
        updateLabelsFromTouches((event?.allTouches())!)
    }
}

