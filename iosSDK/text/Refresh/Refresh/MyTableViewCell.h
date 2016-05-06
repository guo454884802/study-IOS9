//
//  MyTableViewCell.h
//  Refresh
//
//  Created by  wj on 16/5/4.
//  Copyright © 2016年 gzq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyModel.h"

@interface MyTableViewCell : UITableViewCell

@property(nonatomic,strong) UIImageView *iconImage;
@property(nonatomic,strong) UILabel *nameLabel;
@property(nonatomic,strong) UILabel *idLabel;
-(void)configCellWithMode:(MyModel *)model;

@end
