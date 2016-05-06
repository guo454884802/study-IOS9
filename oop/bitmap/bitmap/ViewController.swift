//
//  ViewController.swift
//  bitmap
//
//  Created by  wj on 15/11/15.
//  Copyright © 2015年 gzq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myBoundingBox = CGRectMake(0, 0, 500, 600)
        let myBitmapContext = MyCreateBitmapContext(400, pixelsHigh: 300)
        CGContextSetRGBFillColor(myBitmapContext, 1, 0, 0, 1)
        CGContextFillRect(myBitmapContext, CGRectMake(0, 0, 440, 100))
        CGContextSetRGBFillColor(myBitmapContext, 0, 0, 1, 0.5)
        CGContextFillRect(myBitmapContext, CGRectMake(0, 0, 100, 200))
        let myImage = CGBitmapContextCreateImage(myBitmapContext)
        CGContextDrawImage(myBitmapContext, myBoundingBox, myImage)
        let bitmapData = CGBitmapContextGetData(myBitmapContext)
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func MyCreateBitmapContext(pixelswide:Int,pixelsHigh:Int) -> CGContextRef{
        let context:CGContextRef
        let bitmapBytesPerRow = pixelswide * 4
        let bitmapBytesCount = bitmapBytesPerRow * pixelsHigh
        let colorSpace = CGColorSpaceCreateWithName(kCGColorSpaceGenericRGB)
        let bitmapData = calloc(4, bitmapBytesCount)
        if bitmapData == nil{
            print("Memory not allocated!")
            
        }
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.PremultipliedLast.rawValue)
        context = CGBitmapContextCreate(bitmapData, pixelswide, pixelsHigh, 8, bitmapBytesPerRow, colorSpace, bitmapInfo.rawValue)!
        return context
        
    }
}

