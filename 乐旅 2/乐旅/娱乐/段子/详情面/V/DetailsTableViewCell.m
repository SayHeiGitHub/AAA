
//
//  DetailsTableViewCell.m
//  乐旅
//
//  Created by 姜鸥人 on 16/3/15.
//  Copyright © 2016年 姜鸥人. All rights reserved.
//

#import "DetailsTableViewCell.h"

@implementation DetailsTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self =[ super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self allViews];
    }
    return  self;
}


-(void)allViews{
    // 用户头像
    self.userImageView = [[UIImageView alloc]init];
    self.userImageView.backgroundColor= [UIColor redColor];
    [self.contentView addSubview: self.userImageView];
    self.userImageView.sd_layout.widthIs(50).heightIs(50).topSpaceToView(self.contentView,10).leftSpaceToView(self.contentView ,10);
    self.userImageView.sd_cornerRadiusFromHeightRatio = @(0.5);
    // 用户名
    self.userName = [[UILabel alloc]init];
    self.userName.backgroundColor = [UIColor greenColor];
    [self.contentView addSubview:self.userName];
    self.userName.sd_layout.topEqualToView(self.userImageView) .leftSpaceToView(self.userImageView,10).rightSpaceToView(self.contentView,100).heightRatioToView(self.userImageView,0.4);
  // 内容
    self.userContentLabel = [[UILabel alloc]init];
    self.userContentLabel.backgroundColor = [UIColor yellowColor];
    [self.contentView addSubview:self.userContentLabel];
    self.userContentLabel.sd_layout.topSpaceToView(self.userName ,10).rightSpaceToView(self.contentView,10).leftEqualToView(self.userName).bottomSpaceToView(self.contentView,10).autoHeightRatio(0);

    self.floor = [[UILabel alloc]init];
    self.floor.backgroundColor = [UIColor blueColor];
    [self.contentView addSubview:self.floor];
    self.floor.sd_layout.topEqualToView(self.userName).leftSpaceToView(self.userName,20).rightSpaceToView(self.contentView,10).heightRatioToView(self.userImageView,0.4);
    
    
    self.time = [[UILabel alloc]init];
    self.time.backgroundColor  = [UIColor cyanColor];
    [self.contentView addSubview:self.time];
    self.time.sd_layout.leftEqualToView(self.userContentLabel).bottomSpaceToView(self.contentView,10).topSpaceToView(self.userContentLabel,10).widthIs(60);
}
+(CGFloat)heightForLableText:(NSString *)text{
    
    CGSize size = CGSizeMake(300,1000);
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:20]};
    CGRect rect = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
    return rect.size.height;
}
-(void)changeOtherBtn:(CGRect)rect{
    self.time.frame = CGRectMake(self.time.frame.origin.x, CGRectGetMaxY(rect)+15, self.time.frame.size.width, self.time.frame.size.height);
//    self.admire.frame = CGRectMake(self.admire.frame.origin.x, CGRectGetMaxY(rect)+15, self.admire.frame.size.width, self.admire.frame.size.height);
//    self.admireNum.frame = CGRectMake(self.admireNum.frame.origin.x, CGRectGetMaxY(rect)+15, self.admireNum.frame.size.width, self.admireNum.frame.size.height);
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
