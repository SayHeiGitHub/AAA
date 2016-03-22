//
//  BreakImageViewCell.m
//  乐旅
//
//  Created by 姜鸥人 on 16/3/17.
//  Copyright © 2016年 姜鸥人. All rights reserved.
//

#import "BreakImageViewCell.h"

static CGSize size;
@implementation BreakImageViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
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
    //给自己添加背景图片
    //userImage
    self.userImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 40, 40)];
    self.userImageView.layer.masksToBounds = YES;
    self.userImageView.layer.cornerRadius = 20;
    self.userImageView.userInteractionEnabled = YES;
    [self.userView addSubview:self.userImageView];
    //userLable
    self.userName = [[UILabel alloc] initWithFrame:CGRectMake(60, 10, 200, 40)];
    self.userName.font = [UIFont fontWithName:@"ArialMT" size:19];
    [self.userView addSubview:self.userName];
//    //type
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
    //aaaa
    self.aaaa = [[UIImageView alloc] initWithFrame:CGRectMake(25, CGRectGetMaxY(self.userContentLabel.frame), 325, 325)];
    self.aaaa.userInteractionEnabled = YES;
    [self.contentView addSubview:self.aaaa];
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

    // Configure the view for the selected state
}

@end
