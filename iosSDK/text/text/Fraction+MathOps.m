//
//  Fraction+MathOps.m
//  text
//
//  Created by  wj on 16/4/30.
//  Copyright © 2016年 gzq. All rights reserved.
//

#import "Fraction+MathOps.h"

@implementation Fraction (MathOps)

-(Fraction *)sub:(Fraction *)f{
    
    Fraction *result = [[Fraction alloc]init];
    result.numerator = (self.numerator * f.denominator) - (self.denominator * f.numerator);
    result.denominator = self.denominator * f.denominator;
//    [result reduce];
    
    return result;
}
-(Fraction *) mul:(Fraction *)f{
    
    Fraction *result = [[Fraction alloc]init];
    result.numerator = self.numerator * f.numerator;
    result.denominator = self.denominator * f.denominator;
    
//    [result reduce];
    return result;
}
-(Fraction *) div:(Fraction *)f{
    
    Fraction *result = [[Fraction alloc]init];
    result.numerator = self.numerator * f.denominator;
    result.denominator = self.denominator * f.numerator;
//    [result reduce];
    
    return result;
}
-(Fraction *) initWith1{
   return  [super init];
}


@end
