//
//  Fraction.h
//  text
//
//  Created by  wj on 16/4/18.
//  Copyright © 2016年 gzq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Fraction : NSObject

@property int numerator,denominator;

-(void) print;
-(double) convertToNum;
-(void) setTo:(int) n over:(int) d;
-(Fraction *) add:(Fraction *)f;
-(Fraction *)initWith:(int) n over:(int)d;
+(Fraction *) allocF;
+(int) count;

@end
