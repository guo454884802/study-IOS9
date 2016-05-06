//
//  MyTableViewCell.m
//  NSURL
//
//  Created by  wj on 16/5/4.
//  Copyright © 2016年 gzq. All rights reserved.
//

#import "MyTableViewCell.h"

@implementation MyTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self creatUI];
    }
    return self;
}

-(void)creatUI{
    self.iconView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 70, 70)];
    
    [self.contentView addSubview:self.iconView];
    
    self.nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(90, 10, 200, 20)];
    
    self.nameLabel.font = [UIFont boldSystemFontOfSize:18];
    
    [self.contentView addSubview:self.nameLabel];
    
    self.idLabel = [[UILabel alloc]initWithFrame:CGRectMake(90, 50, 200, 20)];
    
    self.idLabel.font = [UIFont boldSystemFontOfSize:10];
    
    [self.contentView addSubview:self.idLabel];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
