//
//  RootViewController.h
//  Block
//
//  Created by  wj on 16/5/3.
//  Copyright © 2016年 gzq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController

@property (nonatomic,copy) void(^myBlock)(UIColor *,NSString *);

@end
