//
//  Complex.h
//  text
//
//  Created by  wj on 16/4/29.
//  Copyright © 2016年 gzq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Complex : NSObject
@property double real,imaginary;

-(void) print;
-(void) setReal:(double) a andImaginary:(double) b;
-(Complex *) add:(Complex *)f;

@end
