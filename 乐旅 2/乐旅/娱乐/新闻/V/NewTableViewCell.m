//
//  NewTableViewCell.m
//  乐旅
//
//  Created by 姜鸥人 on 16/3/16.
//  Copyright © 2016年 姜鸥人. All rights reserved.
//

#import "NewTableViewCell.h"

@implementation NewTableViewCell



-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self allViews];
    }
    return  self;
}


-(void)allViews{
    self.NewPic = [[UIImageView alloc]init];
    self.NewLabel = [[UILabel alloc]init];
    self.NewContent = [[UILabel alloc]init];
    
    
    [self.contentView addSubview:self.NewPic];
    [self.contentView addSubview:self.NewLabel];
    [self.contentView addSubview:self.NewContent];
    
    self.NewPic.backgroundColor =[ UIColor redColor];
     self.NewLabel.backgroundColor =[ UIColor grayColor];
     self.NewContent.backgroundColor =[ UIColor yellowColor];
    
    //self.NewPic.frame = CGRectMake(10, 10, 50, 50);
    self.NewPic.sd_layout.topSpaceToView(self.contentView,10).leftSpaceToView(self.contentView,10).widthIs(50).heightIs(50);

    self.NewLabel.sd_layout.topEqualToView(self.NewPic).leftSpaceToView(self.NewPic,15).rightSpaceToView(self.contentView,10).heightIs(20);
    self.NewContent.sd_layout.leftEqualToView(self.NewLabel).topSpaceToView(self.NewLabel,10).rightSpaceToView(self.contentView,10).bottomSpaceToView(self.contentView,10).autoHeightRatio(0);
    
    
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
