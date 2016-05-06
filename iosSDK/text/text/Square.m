//
//  Square.m
//  text
//
//  Created by  wj on 16/4/29.
//  Copyright © 2016年 gzq. All rights reserved.
//

#import "Square.h"

@implementation Square

-(void)setSide:(int)s{
    
    [self setWidth:s setHeight:s];
    
}
-(int) side{
    return [self width];
}


@end
