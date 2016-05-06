//
//  ViewController.m
//  Block
//
//  Created by  wj on 16/5/3.
//  Copyright © 2016年 gzq. All rights reserved.
//

#import "ViewController.h"
#import "RootViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"页面1";
    self.view.backgroundColor = [UIColor whiteColor];
    
    void (^myBlock)(NSString *str);
    myBlock = ^(NSString *str){
        NSLog(@"%@",str);
    };
    myBlock(@"1111");
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    RootViewController *root = [[RootViewController alloc] init];
    
    root.myBlock = ^(UIColor *color,NSString *name){
        self.view.backgroundColor = color;
        self.title = name;
    };
    [self.navigationController pushViewController:root animated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
