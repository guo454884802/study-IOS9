//
//  MyTableViewCell.m
//  Refresh
//
//  Created by  wj on 16/5/4.
//  Copyright © 2016年 gzq. All rights reserved.
//

#import "MyTableViewCell.h"
#import "UIImageView+WebCache.h"

@implementation MyTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self creatUI];
    }
    return self;
}
-(void)creatUI{
    self.iconImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 70, 70)];
    [self.contentView addSubview:self.iconImage];
    
    self.nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(90, 10, 200, 20)];
    self.nameLabel.font = [UIFont boldSystemFontOfSize:18];
    [self.contentView addSubview:self.nameLabel];
    
    self.idLabel = [[UILabel alloc]initWithFrame:CGRectMake(90, 50, 200, 20)];
    [self.contentView addSubview:self.idLabel];
}
-(void)configCellWithMode:(MyModel *)model{
    
    [self.iconImage sd_setImageWithURL:[NSURL URLWithString:model.iconUrl ]  placeholderImage:nil];
    
    self.nameLabel.text = model.name;
    
    self.idLabel.text = model.applicationId;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
