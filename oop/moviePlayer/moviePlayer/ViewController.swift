//
//  ViewController.swift
//  moviePlayer
//
//  Created by  wj on 15/11/17.
//  Copyright © 2015年 gzq. All rights reserved.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController{

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlStr = NSBundle.mainBundle().pathForResource("11", ofType: "mp4")
        let url = NSURL.fileURLWithPath(urlStr!)
        let play1 = MPMoviePlayerViewController(contentURL: url)
        play1.view.frame = self.view.bounds
        play1.view.backgroundColor = UIColor.orangeColor()
        self.presentMoviePlayerViewControllerAnimated(play1)
        self.view.addSubview(play1.view)
//        self.moviePlayer()
        //       let a  = NSBundle.mainBundle().resourcePath
//        print(a)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func getFileUrl() -> NSURL{
        
        let urlStr = NSBundle.mainBundle().pathForResource("11", ofType: "mp4")
        let url = NSURL.fileURLWithPath(urlStr!)
        
        return url
    }
// //    func moviePlayer() -> MPMoviePlayerViewController{
// //        let url = self.getFileUrl()
// //        let moviePlayer = MPMoviePlayerViewController(contentURL: url)
// //        moviePlayer.view.frame = self.view.bounds
// //
// //        moviePlayer.view.autoresizingMask = UIViewAutoresizing.FlexibleWidth ; UIViewAutoresizing.FlexibleHeight
// //        self.presentMoviePlayerViewControllerAnimated(moviePlayer)
// //        self.view.addSubview(moviePlayer.view)
// //       return moviePlayer
// //    }
     func moviePlayer() -> MPMoviePlayerViewController{
        let url = self.getFileUrl()
        let moviePlayer = MPMoviePlayerViewController(contentURL: url)
        moviePlayer.view.frame = self.view.bounds
        
        moviePlayer.view.autoresizingMask = UIViewAutoresizing.FlexibleHeight ; UIViewAutoresizing.FlexibleHeight
        self.presentMoviePlayerViewControllerAnimated(moviePlayer)
        self.view.addSubview(moviePlayer.view)
        return moviePlayer
        
 
     }
//    func addNotification(){
//        let notificationCenter = NSNotificationCenter.defaultCenter()
//        notificationCenter.addObserverForName(MPMoviePlayerPlaybackStateDidChangeNotification, object: self, queue: NSOperationQueue.mainQueue()) { (_) -> Void in
//            switch self.moviePlayer().playbackState{
//            case MPMoviePlaybackState.Playing:
//                print("正在播放")
//                
//            case MPMoviePlaybackState.Paused:
//                print("暂停播放")
//                
//            case MPMoviePlaybackState.Stopped:
//                print("停止播放")
//                
//            default:
//                break
//            }
//
//        }
//        notificationCenter.addObserverForName(MPMoviePlayerPlaybackDidFinishNotification, object: self, queue: NSOperationQueue.mainQueue()) { (_) -> Void in
//            print("播放完成\(self.moviePlayer().playbackState)")
//        
//
//        }
//    }
//
// //    func mediaPlayerPlaybackStateChange(notification:NSNotification){
// //        switch self.moviePlayer().playbackState{
// //        case MPMoviePlaybackState.Playing:
// //            print("正在播放")
// //
// //        case MPMoviePlaybackState.Paused:
// //            print("暂停播放")
// //
// //        case MPMoviePlaybackState.Stopped:
// //            print("停止播放")
// //
// //        default:
// //            break
// //        }
// //    }
// //    func mediaPlayerPlaybackFinished(notification:NSNotification){
// //        print("播放完成\(self.moviePlayer().playbackState)")
// //    }
}

