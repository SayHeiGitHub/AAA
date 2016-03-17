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
    [self.contentView addSubview:self.FoodName];
    [self.contentView addSubview:self.FoodImage];
    
    self.FoodImage.sd_layout.topSpaceToView(self.contentView,10).leftSpaceToView(self.contentView,10).widthIs(60)
    .heightIs(60);
    self.FoodImage.backgroundColor = [UIColor redColor];
     self.FoodName.sd_layout.topEqualToView(self.FoodImage).leftSpaceToView(self.FoodImage,10).rightSpaceToView(self.contentView,10).heightIs(self.FoodImage.width).autoHeightRatio(0);
    self.FoodName.backgroundColor = [UIColor yellowColor];
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
