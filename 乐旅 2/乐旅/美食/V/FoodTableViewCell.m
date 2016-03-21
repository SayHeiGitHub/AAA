//
//  FoodTableViewCell.m
//  乐旅
//
//  Created by 姜鸥人 on 16/3/16.
//  Copyright © 2016年 姜鸥人. All rights reserved.
//

#import "FoodTableViewCell.h"

@implementation FoodTableViewCell



-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if ( self) {
        [self autoLayoutSubView];
    }
    return self;
}

-(void)autoLayoutSubView{
    self.FoodImage = [[UIImageView alloc]init];
    self.FoodName = [[UILabel alloc]init];
    self.staLab = [[UILabel alloc]init];
    self.avgLab = [[UILabel alloc]init];
    self.tagsLab = [[UILabel alloc]init];
    [self.contentView addSubview: self.avgLab];
    [self.contentView addSubview:self.tagsLab];
    [self.contentView addSubview:self.staLab];
    [self.contentView addSubview:self.FoodName];
    [self.contentView addSubview:self.FoodImage];
    
    self.FoodImage.sd_layout.topSpaceToView(self.contentView,10).leftSpaceToView(self.contentView,10).widthIs(80)
    .heightIs(80);
    self.FoodName.font = [UIFont systemFontOfSize:20];
    self.FoodName.sd_layout.topEqualToView(self.FoodImage).leftSpaceToView(self.FoodImage,20).rightSpaceToView(self.contentView,10).heightIs(30);

    self.staLab.sd_layout.leftEqualToView(self.FoodName).topSpaceToView(self.FoodName,20).widthIs(80).heightIs(30);
    self.avgLab.sd_layout.leftSpaceToView(self.staLab,20).topEqualToView(self.staLab).widthIs(100).heightIs(30);
    //饭店温馨提示
    self.tagsLab.numberOfLines = 0;
    self.tagsLab.sd_layout.leftSpaceToView(self.contentView,10).topSpaceToView(self.FoodImage,10).rightSpaceToView(self.contentView,10).heightIs(40);
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
