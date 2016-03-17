//
//  SecnicTableViewCell.m
//  乐旅
//
//  Created by 姜鸥人 on 16/3/16.
//  Copyright © 2016年 姜鸥人. All rights reserved.
//

#import "SecnicTableViewCell.h"

@implementation SecnicTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self  = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self ) {
        [self autoLayout];
    }
    return self;
}

-(void)autoLayout{
    self.SecnicPic = [[UIImageView alloc]init];
    self.SecnicLabel = [[UILabel alloc]init];
    [self.contentView addSubview:self.SecnicLabel];
    [self.contentView addSubview:self.SecnicPic];
    
    self.SecnicPic.sd_layout.topSpaceToView(self.contentView,10).leftSpaceToView(self.contentView,10).widthIs(70).heightIs(70);
    self.SecnicPic.backgroundColor = [UIColor redColor];
    self.SecnicLabel.sd_layout.topEqualToView(self.SecnicPic).leftSpaceToView(self.SecnicPic,10).rightSpaceToView(self.contentView,10).heightIs(self.SecnicPic.width).autoHeightRatio(0);
    self.SecnicLabel.backgroundColor =[ UIColor yellowColor];
    
    
    
    
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
