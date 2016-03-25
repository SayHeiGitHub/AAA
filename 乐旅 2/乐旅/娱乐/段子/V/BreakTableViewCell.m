//
//  BreakTableViewCell.m
//  乐旅
//
//  Created by 姜鸥人 on 16/3/16.
//  Copyright © 2016年 姜鸥人. All rights reserved.
//

#import "BreakTableViewCell.h"

@implementation BreakTableViewCell


static CGSize size;
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self  = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self allViews];
    }
    return self;
    
}
-(void)allViews{
    size = [UIScreen mainScreen].bounds.size;
    //userView
    self.userView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, size.width, 60)];
  
    [self.contentView addSubview:self.userView];
    //userImage
    self.userImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 40, 40)];
    self.userImageView.layer.masksToBounds = YES;
    self.userImageView.layer.cornerRadius = 20;
    [self.userView addSubview:self.userImageView];
    //userLable
    self.userName = [[UILabel alloc] initWithFrame:CGRectMake(60, 10, 200, 40)];
    [self.userView addSubview:self.userName];
    //type
//    self.type = [[UILabel alloc] initWithFrame:CGRectMake(size.width-70, 10, 60, 40)];
//    self.type.font = [UIFont systemFontOfSize:15];
//    [self.userView addSubview:self.type];
    
    //content
    self.userContentLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 60, size.width-20, 275)];
    self.userContentLabel.numberOfLines = 0;
    [self.contentView addSubview:self.userContentLabel];
    //smileBtn
    self.smileBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.smileBtn.frame = CGRectMake(10, self.userContentLabel.frame.size.height+90, 20, 20);
    [self.smileBtn setBackgroundImage:[UIImage imageNamed:@"icon_for_enable@2x"] forState:UIControlStateNormal];
    [self.contentView addSubview:self.smileBtn];
    //cryBtn
    self.cryBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.cryBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.cryBtn setBackgroundImage:[UIImage imageNamed:@"icon_against_enable@2x"] forState:UIControlStateNormal];
    self.cryBtn.frame = CGRectMake(70, self.userContentLabel.frame.size.height+90, 20, 20);
    [self.contentView addSubview:self.cryBtn];
    //commentBtn
    self.commemtBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.commemtBtn.frame = CGRectMake(130, self.userContentLabel.frame.size.height+90, 20, 20);
    [self.commemtBtn setBackgroundImage:[UIImage imageNamed:@"icon_comment@2x.png"] forState:UIControlStateNormal];
    [self.contentView addSubview:self.commemtBtn];
    //shareBtn
    self.shareBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.shareBtn.frame = CGRectMake(size.width-35, self.userContentLabel.frame.size.height+90, 20, 20);
    [self.shareBtn setBackgroundImage:[UIImage imageNamed:@"icon_share@2x"] forState:UIControlStateNormal];
    [self.contentView addSubview:self.shareBtn];
    //smileNum
    self.smileNum = [[UILabel alloc] initWithFrame:CGRectMake(5, CGRectGetMinY(self.shareBtn.frame)-5, 300, 10)];
    self.smileNum.font = [UIFont systemFontOfSize:10];
    [self.contentView addSubview:self.smileNum];

}

+(CGFloat)heightForLableText:(NSString *)text{
    
    CGSize size = CGSizeMake(300,1000);
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:20]};
    CGRect rect = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
    return rect.size.height;
}

- (void)awakeFromNib {


}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

   }

//改变其他button的Frame
-(void)changeOtherBtn:(CGRect)rect{
    self.smileBtn.frame = CGRectMake(self.smileBtn.frame.origin.x, CGRectGetMaxY(rect)+25, self.smileBtn.frame.size.width, self.smileBtn.frame.size.height);
    //smileNum
    self.smileNum.frame =CGRectMake(self.smileNum.frame.origin.x, CGRectGetMaxY(rect)+10, self.smileNum.frame.size.width, self.smileNum.frame.size.height);
    self.cryBtn.frame = CGRectMake(self.cryBtn.frame.origin.x, CGRectGetMaxY(rect)+25, self.cryBtn.frame.size.width, self.cryBtn.frame.size.height);
    self.commemtBtn.frame = CGRectMake(self.commemtBtn.frame.origin.x, CGRectGetMaxY(rect)+25, self.commemtBtn.frame.size.width, self.commemtBtn.frame.size.height);
    self.shareBtn.frame = CGRectMake(self.shareBtn.frame.origin.x, CGRectGetMaxY(rect)+25, self.shareBtn.frame.size.width, self.shareBtn.frame.size.height);

}
@end
