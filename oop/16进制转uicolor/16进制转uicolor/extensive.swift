//
//  extensive.swift
//  16进制转uicolor
//
//  Created by  wj on 15/11/14.
//  Copyright © 2015年 gzq. All rights reserved.
//

import Foundation
import UIKit

extension UIColor{
    public convenience init(rgba:String){
        var red:CGFloat = 0.0
        var green:CGFloat = 0.0
        var blue:CGFloat = 0.0
        var alpha:CGFloat = 1.0
        
        if rgba.hasPrefix("#")
        {
            let index = rgba.startIndex.advancedBy(1)
            let hex = rgba.substringFromIndex(index)
            let scanner = NSScanner(string: hex)
            var hexValue :CUnsignedLongLong = 0
            
            if scanner.scanHexLongLong(&hexValue){
                red = CGFloat((hexValue & 0xFF000000) >> 24) / 255.0
                green = CGFloat((hexValue & 0x00FF0000) >> 16) / 255.0
                blue = CGFloat((hexValue & 0x0000FF00) >> 8) / 255.0
                alpha = CGFloat(hexValue & 0x000000FF) / 255.0
            }
        }else{
            print("无效的RGB字符串，遗失了‘＃’作为前缀")
        }
        self.init(red:red,green:green,blue:blue,alpha:alpha)
    }
    
}

