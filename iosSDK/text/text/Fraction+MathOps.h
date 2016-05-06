//
//  Fraction+MathOps.h
//  text
//
//  Created by  wj on 16/4/30.
//  Copyright © 2016年 gzq. All rights reserved.
//

#import "Fraction.h"

@interface Fraction (MathOps)

-(Fraction *)mul:(Fraction *)f;
-(Fraction *)sub:(Fraction *)f;
-(Fraction *)div:(Fraction *)f;
-(Fraction *) initWith1;

@end
