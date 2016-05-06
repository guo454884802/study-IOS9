//
//  QuartzFunView.swift
//  QuartzFun
//
//  Created by  wj on 16/1/26.
//  Copyright © 2016年 gzq. All rights reserved.
//

import UIKit

extension UIColor{
    class func randomColor() -> UIColor {
        let red = CGFloat(Double(arc4random() % 256) / 255)
        let green = CGFloat(Double(arc4random() % 256) / 255)
        let blue = CGFloat(Double(arc4random() % 256) / 255)
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
enum Shape:UInt{
    case Line = 0, Rect, Ellipse, Image
}
enum DrawingColor:UInt{
    case Red = 0, Blue, Yellow, Green, Random
}
class QuartzFunView: UIView {

    var shape = Shape.Line
    var currentColor = UIColor.redColor()
    var useRandomColor = false
    
    private let image = UIImage(named: "iphone")!
    private var firstTouchLocation:CGPoint = CGPointZero
    private var lastTouchLocation:CGPoint = CGPointZero
    private var redrawRect:CGRect = CGRectZero
    
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        
        let context = UIGraphicsGetCurrentContext()
        CGContextSetLineWidth(context, 2.0)
        CGContextSetStrokeColorWithColor(context, currentColor.CGColor)
        
        CGContextSetFillColorWithColor(context, currentColor.CGColor)
//        let currentRect = CGRectMake(firstTouchLocation.x, firstTouchLocation.y, lastTouchLocation.x - firstTouchLocation.x, lastTouchLocation.y - firstTouchLocation.y)
        
        switch shape{
        case.Line:
            CGContextMoveToPoint(context, firstTouchLocation.x, firstTouchLocation.y)
            CGContextAddLineToPoint(context, lastTouchLocation.x, lastTouchLocation.y)
            CGContextStrokePath(context)
        case.Rect:
            CGContextAddRect(context, currentRect())
            CGContextDrawPath(context, .FillStroke)
        case.Ellipse:
            CGContextAddEllipseInRect(context, currentRect())
            CGContextDrawPath(context, .FillStroke)
        case.Image:
            let horizontalOffset = image.size.width / 2
            let verticalOffset = image.size.height / 2
            let drawPoint = CGPointMake(lastTouchLocation.x - horizontalOffset, lastTouchLocation.y - verticalOffset)
            image.drawAtPoint(drawPoint)
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if useRandomColor {
            currentColor = UIColor.randomColor()
        }
        let touch = (touches as NSSet).anyObject()  as! UITouch
        firstTouchLocation = touch.locationInView(self)
        lastTouchLocation = firstTouchLocation
        redrawRect = CGRectZero
        setNeedsDisplay()
    }
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = (touches as NSSet).anyObject() as! UITouch
        lastTouchLocation = touch.locationInView(self)
        
        if shape == .Image{
            let horizontalOffset = image.size.width / 2
            let verticalOffset = image.size.height / 2
            redrawRect = CGRectUnion(redrawRect, CGRectMake(lastTouchLocation.x - horizontalOffset, lastTouchLocation.y - verticalOffset, image.size.width, image.size.height))
        }else{
            redrawRect = CGRectUnion(redrawRect, currentRect2())
        }
        setNeedsDisplayInRect(redrawRect)
    }
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = (touches as NSSet).anyObject() as! UITouch
        lastTouchLocation = touch.locationInView(self)
       
        if shape == .Image{
            let horizontalOffset = image.size.width / 2
            let verticalOffset = image.size.height / 2
            redrawRect = CGRectUnion(redrawRect, CGRectMake(lastTouchLocation.x - horizontalOffset, lastTouchLocation.y - verticalOffset, image.size.width, image.size.height))
        }else{
            redrawRect = CGRectUnion(redrawRect, currentRect2())
        }
        setNeedsDisplayInRect(redrawRect)
    }
    func currentRect() -> CGRect{
        return CGRectMake(firstTouchLocation.x, firstTouchLocation.y, lastTouchLocation.x - firstTouchLocation.x , lastTouchLocation.y - firstTouchLocation.y )
    }
    func currentRect2() -> CGRect{
        return CGRectMake(firstTouchLocation.x, firstTouchLocation.y, lastTouchLocation.x - firstTouchLocation.x + 30 , lastTouchLocation.y - firstTouchLocation.y + 30 )
    }

}
