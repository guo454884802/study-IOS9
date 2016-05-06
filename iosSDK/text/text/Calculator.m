//
//  Calculator.m
//  text
//
//  Created by  wj on 16/4/19.
//  Copyright © 2016年 gzq. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator
{
    double accumulator;
}
-(void) setAccumulator:(double)value{
    accumulator = value;
}
-(void) clear{
    accumulator = 0;
}
-(double) accumulator{
    return accumulator;
}
-(void) add:(double) value{
    accumulator += value;
}
-(void) subtract:(double)value{
    accumulator -= value;
}
-(void) multiply:(double)value{
    accumulator *= value;
}
-(void) divide:(double)value{
    accumulator /= value;
}

@end
