//
//  ViewController.m
//  XML
//
//  Created by  wj on 16/5/5.
//  Copyright © 2016年 gzq. All rights reserved.
//

#import "ViewController.h"
#import "GDataXMLNode.h"

@interface ViewController (){
    
    GDataXMLDocument *_document;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"xml" ofType:@"txt"];
    
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    _document = [[GDataXMLDocument alloc]initWithData:data options:0 error:nil];
    
    GDataXMLElement *rootElement = [_document rootElement];
    
    NSArray *booksElementArray = [rootElement elementsForName:@"books"];
    
    GDataXMLElement *booksElement = booksElementArray[0];
    
    NSArray *bookElementArray = [booksElement elementsForName:@"book"];
    
    for(GDataXMLElement *bookElement in booksElementArray){
        
        NSArray *summaryElementArray = [bookElement elementsForName:@"summary"];
        
        GDataXMLElement *summaryElement = summaryElementArray[0];
        
        NSLog(@"%@",[summaryElement stringValue]);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
