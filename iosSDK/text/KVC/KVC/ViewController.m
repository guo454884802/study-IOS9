//
//  ViewController.m
//  KVC
//
//  Created by  wj on 16/5/4.
//  Copyright © 2016年 gzq. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"

@interface ViewController (){
    
    Student *student;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    student = [[Student alloc]init];
    student.name = @"韦德";
    
    //KVC -->KEY VALUE Coding
    [student setValue:@"白边" forKey:@"name"];
    NSLog(@"%@",student.name);
    
    
    //KVO -->KEY VALUE Observer
    [student addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew  context:nil];
    
    student.name = @"德罗赞";
    NSLog(@"%@",student.name);
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    
    NSString *old = [change objectForKey:@"old"];
    NSString *new = [change objectForKey:@"new"];
    
    NSLog(@"%@ %@",old,new);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
