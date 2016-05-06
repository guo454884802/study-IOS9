//
//  GraphicsViewController.swift
//  Graphics
//
//  Created by  wj on 15/11/11.
//  Copyright © 2015年 gzq. All rights reserved.
//

import UIKit

class GraphicsViewController: UIView {
    
    var xcodeImageView = UIImageView()
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
//        let xcodeIcon = UIImage(named: "111")
//        xcodeIcon?.drawAtPoint(CGPoint(x: 0, y: 20))
//        xcodeIcon?.drawInRect(CGRect(x: 50, y: 10, width: 40, height: 35))
        let myContext = UIGraphicsGetCurrentContext()
        
        let screenBounds = UIScreen.mainScreen().bounds
        print(screenBounds.width)
        print(screenBounds.height)
        let myBoundingBox = CGRectMake(0, 0, screenBounds.width, screenBounds.height)
        let myBitmapContext = MyCreateBitmapContext(400, pixelsHigh: 300)
        CGContextSetRGBFillColor(myBitmapContext, 1, 0, 0, 1)
        CGContextFillRect(myBitmapContext, CGRectMake(0, 0, 330, 100))
        CGContextSetRGBFillColor(myBitmapContext, 0, 0, 1, 0.5)
        CGContextFillRect(myBitmapContext, CGRectMake(0, 0, 100, 280))
        let myImage = CGBitmapContextCreateImage(myBitmapContext)
        CGContextDrawImage(myContext, myBoundingBox, myImage)
        let bitmapData = CGBitmapContextGetData(myBitmapContext)

//        UIColor.brownColor().set()
//        let currentContext = UIGraphicsGetCurrentContext()
//        CGContextSetLineWidth(currentContext, 1.0)
//        CGContextMoveToPoint(currentContext, 50, 10)
//        CGContextAddLineToPoint(currentContext, 50, 11)
//        CGContextAddLineToPoint(currentContext, 300, 100)
//        CGContextStrokePath(currentContext)
        
//        drawRooftopAtTopPointof(CGPoint(x: 160, y: 40), lineJoin:CGLineJoin.Miter)
//        drawRooftopAtTopPointof(CGPoint(x: 160, y: 180), lineJoin: .Bevel)
//        drawRooftopAtTopPointof(CGPoint(x: 160, y: 320), lineJoin: .Round)

//        let path = CGPathCreateMutable()
//        let screenBounds = UIScreen.mainScreen().bounds
//        CGPathMoveToPoint(path, nil, screenBounds.origin.x, screenBounds.origin.y)
//        CGPathAddLineToPoint(path, nil, screenBounds.size.width, screenBounds.size.height)
//        CGPathMoveToPoint(path, nil, screenBounds.size.width, screenBounds.origin.y)
//        CGPathAddLineToPoint(path, nil, screenBounds.origin.x, screenBounds.size.height)
//        let currentContext = UIGraphicsGetCurrentContext()
//        CGContextAddPath(currentContext, path)
//        UIColor.blueColor().setStroke()
//        CGContextDrawPath(currentContext, .Stroke)

//        let path = CGPathCreateMutable()
//        let rectangle = CGRectMake(113, 194, 512, 220)
//        CGPathAddRect(path, nil, rectangle)
//        
//        
//        let currentContext1 = UIGraphicsGetCurrentContext()
//        CGContextAddPath(currentContext1, path)
//        UIColor.blackColor().setFill()
//        UIColor.redColor().setStroke()
//        CGContextSetLineWidth(currentContext1, 1)
//        CGContextDrawPath(currentContext1, .FillStroke)
        
//        drawRectAtTopOfScreen()
//        drawRectAtBottomOfScreen()
        
//        let currentContext = UIGraphicsGetCurrentContext()
//        CGContextSaveGState(currentContext)
//        let colorSpace = CGColorSpaceCreateDeviceRGB()
//        let startColor = UIColor.orangeColor()
//        let startColorComponents = CGColorGetComponents(startColor.CGColor)
//        let endColor = UIColor.blueColor()
//        let endColorComponents = CGColorGetComponents(endColor.CGColor)
//        let colorComponents = [startColorComponents[0],startColorComponents[1],startColorComponents[2],startColorComponents[3],endColorComponents[0],endColorComponents[1],endColorComponents[2],endColorComponents[3]]
//        let colorIndices:[CGFloat] = [0.0,1.0]
//        let gradient = CGGradientCreateWithColorComponents(colorSpace, colorComponents, colorIndices, 2)
//        //let screenBounds = UIScreen.mainScreen().bounds
//        let startPoint = CGPointMake(120, 260)
//        let endPoint = CGPointMake(200, 220)
//        CGContextDrawLinearGradient(currentContext, gradient, startPoint, endPoint, .DrawsAfterEndLocation )
        
//        let path = CGPathCreateMutable()
//        let rectangle = CGRectMake(10, 10, 200, 300)
//        CGPathAddRect(path, nil, rectangle)
//        let currentContext = UIGraphicsGetCurrentContext()
//        CGContextSaveGState(currentContext)
//       // CGContextTranslateCTM(currentContext, 200, 0)
//        //CGContextScaleCTM(currentContext, 0.5, 0.5)
//        let rotation:CGFloat = CGFloat(45.0 * M_PI / 180.0)
//        CGContextRotateCTM(currentContext, rotation)
//        CGContextAddPath(currentContext, path)
//        UIColor(red: 0.2, green: 0.6, blue: 0.8, alpha: 1).setFill()
//        UIColor.brownColor().setStroke()
//        CGContextSetLineWidth(currentContext, 5)
//        CGContextDrawPath(currentContext, .FillStroke)
//        CGContextRestoreGState(currentContext)
        
//        let image = UIImage(named: "111")
//        xcodeImageView.image = image
//        xcodeImageView.frame = CGRectMake(0, 0, 100, 100)
//        self.addSubview(xcodeImageView)
        
        
    }
    
    func drawRooftopAtTopPointof(paramTopPoint:CGPoint,lineJoin paramLineJoin:CGLineJoin){
        UIColor.brownColor().set()
        let currentContext = UIGraphicsGetCurrentContext()
        CGContextSetLineJoin(currentContext, paramLineJoin)
        CGContextSetLineWidth(currentContext, 20)
        CGContextMoveToPoint(currentContext, paramTopPoint.x - 140, paramTopPoint.y + 100)
        CGContextAddLineToPoint(currentContext, paramTopPoint.x, paramTopPoint.y)
        CGContextAddLineToPoint(currentContext, paramTopPoint.x + 140, paramTopPoint.y + 100)
        CGContextStrokePath(currentContext)
        UIColor.blackColor().set()

    }
    func drawRectAtTopOfScreen(){
        let currentContext = UIGraphicsGetCurrentContext()
        CGContextSaveGState(currentContext)
        CGContextSetShadowWithColor(currentContext, CGSizeMake(10, 10),20, UIColor.grayColor().CGColor)
        let path = CGPathCreateMutable()
        let firstRect = CGRectMake(55, 60, 150, 150)
        CGPathAddRect(path, nil, firstRect)
        CGContextAddPath(currentContext, path)
        UIColor(red: 0.2, green: 0.6, blue: 0.8, alpha: 1).setFill()
        CGContextDrawPath(currentContext, .Fill)
        CGContextRestoreGState(currentContext)
    }
    func drawRectAtBottomOfScreen(){
        let currentContext = UIGraphicsGetCurrentContext()
        let secondPath = CGPathCreateMutable()
        let secondRect = CGRectMake(150, 250, 100, 100)
        CGPathAddRect(secondPath, nil, secondRect)
        CGContextAddPath(currentContext, secondPath)
        UIColor.purpleColor().setFill()
        CGContextDrawPath(currentContext, .Fill)
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
