//
//  Rectangle.h
//  text
//
//  Created by  wj on 16/4/29.
//  Copyright © 2016年 gzq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XYPoint.h"


@interface Rectangle : NSObject



@property int width,height;
-(int) area;
-(int) perimeter;
-(void) setWidth:(int)w setHeight:(int)h;
-(void) setOrigin:(XYPoint *)pt;
-(XYPoint *) origin;

@end
