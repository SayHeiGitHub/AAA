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
    
    self.VedioView = [[UIImageView alloc]init];
    self.VedioView.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:self.VedioView];
    
    self.numberLabel  = [[UILabel alloc]init];
    self.numberLabel.backgroundColor = [UIColor yellowColor];
    [self.contentView addSubview:self.numberLabel];
    
    self.timeLabel = [[UILabel alloc]init];
    self.timeLabel.backgroundColor = [UIColor greenColor];
    [self.contentView addSubview:self.timeLabel];
    
    self.bigLabel = [[UILabel alloc]init];
    self.bigLabel.backgroundColor = [UIColor cyanColor];
    [self.contentView addSubview: self.bigLabel];
    
    
    self.littleLabel = [[UILabel alloc]init];
    self.littleLabel.backgroundColor = [UIColor blackColor];
    [self.contentView addSubview: self.littleLabel];
    
    self.bigLabel.sd_layout.rightSpaceToView(self.contentView ,10).leftSpaceToView(self.contentView,10).topSpaceToView(self.contentView,5).heightIs(25);
    self.littleLabel.sd_layout.rightSpaceToView(self.contentView,10).leftSpaceToView(self.contentView,10).topSpaceToView(self.bigLabel,3).heightIs(20);
    self.VedioView.sd_layout.rightSpaceToView(self.contentView,10).leftSpaceToView(self.contentView,10).topSpaceToView(self.littleLabel,5).bottomSpaceToView(self.contentView,40);
    
    self.timeLabel.sd_layout.leftEqualToView(self.VedioView).topSpaceToView(self.VedioView,10).bottomSpaceToView(self.contentView,10).widthIs(60);
    
    self.numberLabel.sd_layout.leftSpaceToView(self.timeLabel,20).topSpaceToView(self.VedioView,10).bottomSpaceToView(self.contentView ,10).widthIs(60);
    
    
    self.bt = [UIButton buttonWithType:UIButtonTypeSystem];
    
    self.bt.backgroundColor = [UIColor clearColor];
    [self.bt setTitle:@"按钮" forState:UIControlStateNormal];
    
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
