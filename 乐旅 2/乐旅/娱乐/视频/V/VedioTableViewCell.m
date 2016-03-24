//
//  VedioTableViewCell.m
//  乐旅
//
//  Created by 姜鸥人 on 16/3/16.
//  Copyright © 2016年 姜鸥人. All rights reserved.
//

#import "VedioTableViewCell.h"
#import <UIView+SDAutoLayout.h>
#import <UITableView+SDAutoTableViewCellHeight.h>
@implementation VedioTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self allViews];
    }
    return self;
};


-(void)allViews{
    
    UIView *viewbackground=[[UIView alloc]init];
    viewbackground.backgroundColor=[UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:0.03];
    viewbackground.layer.cornerRadius=5;
    [self.contentView addSubview:viewbackground];
    
    self.bigLabel = [[UILabel alloc]init];
    //  self.bigLabel.backgroundColor = [UIColor cyanColor];
    [self.contentView addSubview: self.bigLabel];
    
    
    self.littleLabel = [[UILabel alloc]init];
    self.littleLabel.font=[UIFont fontWithName: @"Helvetica" size:13];
    //设置字体透明度
    self.littleLabel.alpha=0.5;
    //  self.littleLabel.backgroundColor = [UIColor blackColor];
    [self.contentView addSubview: self.littleLabel];
    self.VedioView = [[UIImageView alloc]init];
    //  self.VedioView.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:self.VedioView];
    self.numberLabel  = [[UILabel alloc]init];
    //  self.numberLabel.backgroundColor = [UIColor yellowColor];
    [self.contentView addSubview:self.numberLabel];
    
    self.timeLabel = [[UILabel alloc]init];
    self.timeLabel.font=[UIFont fontWithName: @"Helvetica" size:13];
    //设置字体透明度
    self.timeLabel.alpha=0.5;
    
    [self.contentView addSubview:self.timeLabel];
    //片段的长度引号
    UIImageView *lengthview=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"video_list_cell_time@2x.png"]];
    
    [self.contentView addSubview:lengthview];
    
    UIImageView *playCount1=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"video_list_cell_icon@2x.png"]];
    self.numberLabel.font=[UIFont fontWithName: @"Helvetica" size:13];
    //设置字体透明度
    self.numberLabel.alpha=0.5;
    [self.contentView addSubview:playCount1];
    
    
    viewbackground.sd_layout.rightSpaceToView(self.contentView ,8).leftSpaceToView(self.contentView,5).topSpaceToView(self.contentView,5).bottomSpaceToView(self.contentView,-1);
    
    self.bigLabel.sd_layout.rightSpaceToView(self.contentView ,10).leftSpaceToView(self.contentView,10).topSpaceToView(self.contentView,5).heightIs(25);
    
    
    self.littleLabel.sd_layout.rightSpaceToView(self.contentView,10).leftSpaceToView(self.contentView,10).topSpaceToView(self.bigLabel,3).heightIs(20);
    
    self.VedioView.sd_layout.rightSpaceToView(self.contentView,10).leftSpaceToView(self.contentView,10).topSpaceToView(self.littleLabel,5).heightIs(([UIScreen mainScreen].bounds.size.width-20)*0.5625);
    
    //时间
    lengthview.sd_layout.leftSpaceToView(self.contentView,15).topSpaceToView(self.VedioView,10).bottomSpaceToView(self.contentView,10).widthIs(15);
    self.timeLabel.sd_layout.leftSpaceToView(lengthview,5).topSpaceToView(self.VedioView,10).bottomSpaceToView(self.contentView,10).widthIs(50);
    //评论人数
    playCount1.sd_layout.leftSpaceToView(self.timeLabel,0).topSpaceToView(self.VedioView,10).bottomSpaceToView(self.contentView,10).widthIs(15);
    self.numberLabel.sd_layout.leftSpaceToView(playCount1,5).topSpaceToView(self.VedioView,10).bottomSpaceToView(self.contentView ,10).widthIs(60);
    
    
    self.bt = [UIButton buttonWithType:UIButtonTypeSystem];
    
    self.bt.backgroundColor = [UIColor clearColor];
    UIImage * readselectImage = [[UIImage imageNamed:@"contentview_play@2x.png"]  imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self.bt setImage:readselectImage  forState:UIControlStateNormal];
    
    //    self.but.frame = CGRectMake(50, 50,90 , 90);
    [self.contentView addSubview:self.bt];
    self.bt.sd_layout.topSpaceToView(self.littleLabel,5).leftSpaceToView(self.contentView,10).rightSpaceToView(self.contentView,10).bottomSpaceToView(self.contentView,40);
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
