//
//  ViewController.swift
//  QuartzFun
//
//  Created by  wj on 16/1/26.
//  Copyright © 2016年 gzq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func changeColor(sender: UISegmentedControl) {
        
        let drawingColorSelection = DrawingColor(rawValue: UInt(sender.selectedSegmentIndex))
        if let DrawingColor = drawingColorSelection{
            let funView = view as! QuartzFunView
            switch DrawingColor {
            case.Red:
                funView.currentColor = UIColor.redColor()
                funView.useRandomColor = false
            case.Blue:
                funView.currentColor = UIColor.blueColor()
                funView.useRandomColor = false
            case.Yellow:
                funView.currentColor = UIColor.yellowColor()
                funView.useRandomColor = false
            case.Green:
                funView.currentColor = UIColor.greenColor()
                funView.useRandomColor = false
            case.Random:
                funView.useRandomColor = true
            }
        }
    }

    @IBAction func changeShape(sender: UISegmentedControl) {
        let shapeSelection = Shape(rawValue: UInt(sender.selectedSegmentIndex))
        if let shape = shapeSelection{
            let funView = view as! QuartzFunView
            funView.shape = shape
            colorControl.hidden = shape == Shape.Image
        }
    }
}

