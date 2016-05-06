//
//  ViewController.m
//  Refresh
//
//  Created by  wj on 16/5/4.
//  Copyright © 2016年 gzq. All rights reserved.
//

#import "ViewController.h"
#import "MyTableViewCell.h"
#import "AFNetworking.h"
#import "MJRefresh.h"

#define IMAHEURL @"http://iappfree.candou.com:8080/free/applications/limited?currency=rmb&page=%ld"

@interface ViewController (){
    
    UITableView *_tableView;
    
    NSMutableArray *_dataArray;
    
    NSInteger _page;
    
    BOOL _isPulling;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _isPulling = NO;
    
    _dataArray = [[NSMutableArray alloc]init];
    
    _page = 1;
    
    [self creatTableView];
    
    [self creatData];
    
    [self creatRefresh];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)creatTableView{
    
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    _tableView.delegate = self;
    
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
     NSLog(@"%lu",(unsigned long)_dataArray.count);
    return _dataArray.count;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ID"];
    if (!cell) {
        cell = [[MyTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID"];
    }
    MyModel *model = _dataArray[indexPath.row];
    NSLog(@"%@",model.name);
    [cell configCellWithMode:model];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  90;
}
-(void)creatData{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:[NSString stringWithFormat:IMAHEURL,_page] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        NSArray *array = [dic objectForKey:@"applications"];
        
        if (_isPulling == YES) {
            [_dataArray removeAllObjects];
        }
        
        for(NSDictionary *dic in array){
            MyModel *model = [[MyModel alloc]init];
            
//            model.iconUrl = [dic objectForKey:@"iconUrl"];
//            model.name = [dic objectForKey:@"name"];
//            model.applicationId = [dic objectForKey:@"applicationId"];
            
            [model setValuesForKeysWithDictionary:dic];
            
            [_dataArray addObject:model];
            
             
        }
        
        if (_isPulling ==YES) {
            [_tableView headerEndRefreshing];
        }else{
            [_tableView footerEndRefreshing];
        }
         [_tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
    
}
-(void)creatRefresh{
    
    [_tableView addHeaderWithTarget:self action:@selector(pullRrefresh)];
    
    [_tableView addFooterWithTarget:self action:@selector(pushRefresh)];
}

-(void)pullRrefresh{
    
    _isPulling = YES;
    
    _page = 1;
    
    [self creatData];
}
-(void)pushRefresh{
    
    _isPulling = NO;
    
    _page ++;
    
    [self creatData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
