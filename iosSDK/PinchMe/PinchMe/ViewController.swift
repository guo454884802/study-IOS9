//
//  ViewController.swift
//  PinchMe
//
//  Created by  wj on 16/1/29.
//  Copyright © 2016年 gzq. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIGestureRecognizerDelegate {
    
    private var imageView:UIImageView!
    private var scale:CGFloat = 1
    private var previousScale:CGFloat = 1
    private var rotation:CGFloat = 0
    private var previousRotation:CGFloat = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let image = UIImage(named: "yosemite-meadows")
        imageView = UIImageView(image: image)
        imageView.userInteractionEnabled = true
        imageView.center = view.center
        view.addSubview(imageView)
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: "doPinch:")
        pinchGesture.delegate = self
        imageView.addGestureRecognizer(pinchGesture)
        
        let rotationGesture = UIRotationGestureRecognizer(target: self, action: "doRotate:")
        rotationGesture.delegate = self
        imageView.addGestureRecognizer(rotationGesture)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    func transformImageView(){
        var t = CGAffineTransformMakeScale(scale * previousScale, scale * previousScale)
        t = CGAffineTransformRotate(t, rotation + previousRotation)
        imageView.transform = t
    }
    func doPinch(gesture:UIPinchGestureRecognizer){
        scale = gesture.scale
        transformImageView()
        if gesture.state == .Ended{
            previousScale = scale * previousScale
            scale = 1
        }
    }
    func doRotate(gesture:UIRotationGestureRecognizer){
        rotation = gesture.rotation
        transformImageView()
        if gesture.state == .Ended{
            previousRotation = rotation + previousRotation
            rotation = 0
        }
    }

}

