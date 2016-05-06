//
//  TinyPixUtils.swift
//  TinyPix
//
//  Created by  wj on 16/1/23.
//  Copyright © 2016年 gzq. All rights reserved.
//

import UIKit

class TinyPixUtils {
    class func getTintColorForIndex(index:Int) -> UIColor{
        var color:UIColor
        switch index{
        case 0:
            print("红")
            color = UIColor.redColor()
        case 1:
            print("绿")
            color = UIColor(red: 0, green: 0.6, blue: 0, alpha: 1)
        case 2:
            print("蓝")
            color = UIColor.blueColor()
        default:
            color = UIColor.redColor()
        }
        return color
    }
}

