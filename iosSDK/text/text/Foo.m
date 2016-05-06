//
//  Foo.m
//  text
//
//  Created by  wj on 16/4/29.
//  Copyright © 2016年 gzq. All rights reserved.
//

#import "Foo.h"

@implementation Foo

-(void) setGlobalVal:(int)val{
    
    extern int gGlobalVar;
    gGlobalVar = val;
}

@end
