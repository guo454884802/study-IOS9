//
//  networkPlayViewController.swift
//  videoPlayer
//
//  Created by  wj on 15/11/22.
//  Copyright © 2015年 gzq. All rights reserved.
//

import UIKit
import MediaPlayer

class networkPlayViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let inUrl = "http://7d9hk5.com1.z0.glb.clouddn.com/video11.mp4"
        let play1 = MPMoviePlayerViewController(contentURL: NSURL(string: inUrl))
        play1.moviePlayer.prepareToPlay()
        play1.view.frame = self.view.bounds
        play1.view.backgroundColor = UIColor.orangeColor()
        let transform = CGAffineTransformMakeRotation(CGFloat(M_PI / 2.0))
        play1.view.transform = transform
        self.presentMoviePlayerViewControllerAnimated(play1)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "movieFinishedCallback:", name: MPMoviePlayerPlaybackDidFinishNotification, object: play1.moviePlayer)
        
        self.view.addSubview(play1.view)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func movieFinishedCallback(notify: NSNotification){
        let theMovie = notify.object
        NSNotificationCenter.defaultCenter().removeObserver(self, name: MPMoviePlayerPlaybackDidFinishNotification, object: theMovie)
        self.dismissMoviePlayerViewControllerAnimated()
        
       
        print("执行")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
