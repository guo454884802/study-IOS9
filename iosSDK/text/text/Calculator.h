//
//  Calculator.h
//  text
//
//  Created by  wj on 16/4/19.
//  Copyright © 2016年 gzq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculator : NSObject

-(void) setAccumulator:(double) value;
-(void) clear;
-(double) accumulator;
-(void) add:(double) value;
-(void) subtract:(double) value;
-(void) multiply:(double) value;
-(void) divide:(double) value;

@end
