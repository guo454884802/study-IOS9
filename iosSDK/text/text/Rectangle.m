//
//  Rectangle.m
//  text
//
//  Created by  wj on 16/4/29.
//  Copyright © 2016年 gzq. All rights reserved.
//

#import "Rectangle.h"


@implementation Rectangle
{
    XYPoint *origin;
}

@synthesize width,height;

-(void) setWidth:(int)w setHeight:(int)h{
    width = w;
    height = h;
}
-(int) area{
    int a = width * height;
    return a;
}
-(int) perimeter{
    int a = (width + height) * 2;
    return a;
}
-(void) setOrigin:(XYPoint *)pt{
    //origin = pt;
    if (! origin)
        origin = [[XYPoint alloc]init];
    origin.x = pt.x;
    origin.y = pt.y;
}
-(XYPoint *) origin{
    XYPoint *origin1 = [[XYPoint alloc]init];
    origin1.x = origin.x;
    origin1.y = origin.y;
    return origin1;
}

@end
