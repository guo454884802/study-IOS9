//
//  Geometry.swift
//  TextShooter
//
//  Created by  wj on 16/1/27.
//  Copyright © 2016年 gzq. All rights reserved.
//

import Foundation
import UIKit

func vectorMultiply(v:CGVector,m:CGFloat) -> CGVector{
    return CGVectorMake(v.dx * m, v.dy * m)
}
func vectorBetweenPoints(p1:CGPoint,p2:CGPoint) ->CGVector {
    return CGVectorMake(p2.x - p1.x, p2.y - p1.y)
}
func vectorLength(v:CGVector) -> CGFloat{
    return CGFloat(sqrtf(powf(Float(v.dx), 2) + powf(Float(v.dy),2)))
}

func pointDistance(p1:CGPoint,p2:CGPoint) -> CGFloat{
    return CGFloat(sqrtf(powf(Float(p2.x - p1.x), 2) + powf(Float(p2.y - p1.y),2)))
}