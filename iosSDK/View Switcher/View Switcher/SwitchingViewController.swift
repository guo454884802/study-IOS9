//
//  SwitchingViewController.swift
//  View Switcher
//
//  Created by  wj on 16/1/15.
//  Copyright © 2016年 gzq. All rights reserved.
//

import UIKit

class SwitchingViewController: UIViewController {
    
    private var BlueViewController: blueViewController!
    private var YellowViewController:yellowViewController!

    override func viewDidLoad() {
        super.viewDidLoad()

        
        BlueViewController = storyboard?.instantiateViewControllerWithIdentifier("Blue") as! blueViewController
        BlueViewController.view.frame = view.frame
        switchViewController(from: nil, to: BlueViewController)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        if BlueViewController != nil && BlueViewController.view.superview == nil{
            BlueViewController = nil
        }
        if YellowViewController != nil && YellowViewController.view.superview == nil{
            YellowViewController = nil
        }
    }
    
    @IBAction func switchViews(sender:UIBarButtonItem){
        
        if YellowViewController?.view.superview == nil {
            if YellowViewController == nil{
                YellowViewController = storyboard?.instantiateViewControllerWithIdentifier("Yellow") as! yellowViewController
            }
        }else if BlueViewController?.view.superview == nil {
            if BlueViewController == nil {
                BlueViewController = storyboard?.instantiateViewControllerWithIdentifier("Blue") as! blueViewController
            }
        }
        
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDelay(0.4)
        UIView.setAnimationCurve(.EaseInOut)
        if BlueViewController != nil && BlueViewController.view.superview != nil {
             UIView.setAnimationTransition(.FlipFromRight, forView: view, cache: true)
            YellowViewController.view.frame = view.frame
            switchViewController(from: BlueViewController, to: YellowViewController)
            
        }else{
            UIView.setAnimationTransition(.FlipFromLeft, forView: view, cache: true)
            BlueViewController.view.frame = view.frame
            switchViewController(from: YellowViewController, to: BlueViewController)
        }
        UIView.commitAnimations()
    }
    private func switchViewController(from fromVC:UIViewController?,to toVC:UIViewController?){
        if fromVC != nil {
            fromVC?.willMoveToParentViewController(nil)
            fromVC?.view.removeFromSuperview()
            fromVC?.removeFromParentViewController()
        }
        if toVC != nil{
            self.addChildViewController(toVC!)
            self.view.insertSubview(toVC!.view, atIndex: 0)
            toVC?.didMoveToParentViewController(self)
        }
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
