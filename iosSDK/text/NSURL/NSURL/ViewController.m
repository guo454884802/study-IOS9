//
//  ViewController.m
//  NSURL
//
//  Created by  wj on 16/5/4.
//  Copyright © 2016年 gzq. All rights reserved.
//

#import "ViewController.h"
#import "MyTableViewCell.h"
#import "UIImageView+WebCache.h"

#define JSONURL @"http://iappfree.candou.com:8080/free/applications/limited?currency=rmb&page=1"

@interface ViewController (){
    
    NSMutableData *myData;
    
    NSMutableArray *dataArray;
    
    UITableView *_tableView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    dataArray = [[NSMutableArray alloc]init];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:JSONURL]];
    
    NSURLConnection *connection = [[NSURLConnection alloc]initWithRequest:request delegate:self];
    
    [connection start];
    
    [self creatTableView];
    
    
}
-(void)creatTableView{
    
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    _tableView.delegate = self;
    
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ID"];
    
    if (!cell){
        cell = [[MyTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID"];
    }
    
    NSDictionary *dic = dataArray[indexPath.row];
    [cell.iconView sd_setImageWithURL:[dic objectForKey:@"iconUrl"] placeholderImage:nil];
    
    cell.nameLabel.text = [dic objectForKey:@"name"];
    
    cell.idLabel.text = [dic objectForKey:@"applicationId"];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90;
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    
    myData = [[NSMutableData alloc]init];
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    
    [myData appendData:data];
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    
    NSDictionary *rootDic = [NSJSONSerialization JSONObjectWithData:myData options:NSJSONReadingAllowFragments error:nil];
    
    NSArray *array = [rootDic objectForKey:@"applications"];
    
    for (NSDictionary *dic in array){
        [dataArray addObject:dic];
    }
    
    [_tableView reloadData];
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"%@",error.localizedDescription);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
