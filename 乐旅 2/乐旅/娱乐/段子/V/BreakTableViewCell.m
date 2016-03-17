//
//  BreakTableViewCell.m
//  乐旅
//
//  Created by 姜鸥人 on 16/3/16.
//  Copyright © 2016年 姜鸥人. All rights reserved.
//

#import "BreakTableViewCell.h"

@implementation BreakTableViewCell



-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self  = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self allViews];
    }
    return self;
    
}
-(void)allViews{
    self.userImage =[[UIImageView alloc]init];
    self.userImage.backgroundColor = [UIColor redColor];
    self.userLabel = [[UILabel alloc]init];
    self.userLabel.backgroundColor = [UIColor greenColor];
    self.contentLabel = [[UILabel alloc]init];
    self.contentLabel.backgroundColor = [UIColor yellowColor];
    [self.contentView addSubview:self.userLabel];
    [self.contentView addSubview:self.userImage];
    [self.contentView addSubview:self.contentLabel];
    
    self.userImage.sd_layout.widthIs(50).heightIs(50).topSpaceToView(self.contentView,10).leftSpaceToView(self.contentView ,10);
    self.userLabel.sd_layout.topEqualToView(self.userImage) .leftSpaceToView(self.userImage,10).rightSpaceToView(self.contentView,10).heightRatioToView(self.userImage,0.4);
    self.contentLabel.sd_layout.topSpaceToView(self.userLabel ,10).rightSpaceToView(self.contentView,10).leftEqualToView(self.userLabel).bottomSpaceToView(self.contentView,10).autoHeightRatio(0);
    
    self.userImage.sd_cornerRadiusFromHeightRatio = @(0.5);
    
    [self setupAutoHeightWithBottomView:self.contentView bottomMargin:10];
}
- (void)awakeFromNib {


}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

   }

@end
