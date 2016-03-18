//
//  BreakImageViewCell.m
//  乐旅
//
//  Created by 姜鸥人 on 16/3/17.
//  Copyright © 2016年 姜鸥人. All rights reserved.
//

#import "BreakImageViewCell.h"

@implementation BreakImageViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self allViews];
    }
    return self;
}

-(void)allViews{
    self.userImageView =[[UIImageView alloc]init];
    self.userImageView.backgroundColor = [UIColor redColor];
    self.userName = [[UILabel alloc]init];
    self.userName.backgroundColor = [UIColor greenColor];
    self.userContentLabel = [[UILabel alloc]init];
    self.userContentLabel.backgroundColor = [UIColor yellowColor];
    self.userContentView = [[UIImageView alloc]init];
    self.userContentView .backgroundColor = [UIColor purpleColor];
    self.userView = [[UIView alloc]init];
    self.userView.backgroundColor =[ UIColor redColor];
     [self.contentView addSubview:self.userView];
    [self.contentView addSubview:self.userContentView];
    [self.contentView addSubview:self.userImageView];
    [self.contentView addSubview:self.userName];
    [self.contentView addSubview:self.userContentLabel];
    
    self.userImageView.sd_layout.widthIs(50).heightIs(50).topSpaceToView(self.contentView,10).leftSpaceToView(self.contentView ,10);
    self.userImageView.sd_cornerRadiusFromHeightRatio = @(0.5);
    self.userName.sd_layout.topEqualToView(self.userImageView) .leftSpaceToView(self.userImageView,10).rightSpaceToView(self.contentView,10).heightRatioToView(self.userImageView,0.4);
    self.userContentLabel.sd_layout.topSpaceToView(self.userName ,10).rightSpaceToView(self.contentView,10).leftEqualToView(self.userName).bottomSpaceToView(self.contentView,10).autoHeightRatio(0);
    // 内容的视图
    self.userContentView.sd_layout.leftEqualToView(self.userContentLabel).rightEqualToView(self.userContentLabel).topSpaceToView(self.userContentLabel,5).bottomSpaceToView(self.contentView,50);
    
    
    
    self.userView.sd_layout.bottomSpaceToView(self.contentView,5).leftSpaceToView(self.contentView,25).rightSpaceToView(self.contentView,10).heightIs(40);
    
    // 笑脸
    self.smileBtn = [[UIButton alloc]init];
    self.smileBtn.backgroundColor = [UIColor yellowColor];
    [self.userView addSubview:self.smileBtn];
    self.smileBtn.sd_layout.topSpaceToView(self.userView,3).leftSpaceToView(self.userView,5).bottomSpaceToView(self.userView,3).widthIs(40);
    //哭脸
    self.cryBtn = [[UIButton alloc]init];
    self.cryBtn.backgroundColor = [UIColor greenColor];
    [self.userView addSubview:self.cryBtn];
    self.cryBtn.sd_layout.topEqualToView(self.smileBtn).leftSpaceToView(self.smileBtn,15).bottomEqualToView(self.smileBtn).widthIs(40);
    // 评论
    self.commemtBtn = [[UIButton alloc]init];
    self.commemtBtn.backgroundColor= [UIColor purpleColor];
    [self.userView addSubview:self.commemtBtn];
    self.commemtBtn.sd_layout.topEqualToView(self.cryBtn).leftSpaceToView(self.cryBtn,15).widthIs(40).bottomEqualToView(self.cryBtn);
    // 分享
    self.shareBtn = [[UIButton alloc]init];
    self.shareBtn.backgroundColor = [UIColor blackColor];
    [self.userView addSubview:self.shareBtn];
      [self.shareBtn setTitle:@"分享" forState:UIControlStateNormal];
    self.shareBtn.sd_layout.rightSpaceToView(self.userView,10).topEqualToView(self.cryBtn).bottomEqualToView(self.cryBtn).widthIs(40);
    [self setupAutoHeightWithBottomView:self.contentView bottomMargin:10];
}
- (void)awakeFromNib {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
