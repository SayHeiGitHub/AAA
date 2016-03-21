//
//  FoodDetailTableViewCell.m
//  乐旅
//
//  Created by wumeng  on 16/3/17.
//  Copyright © 2016年 姜鸥人. All rights reserved.
//

#import "FoodDetailTableViewCell.h"
#import "UIView+SDAutoLayout.h"
#import "UITableView+SDAutoTableViewCellHeight.h"
@implementation FoodDetailTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self allView];
    }
    return self;
}

- (void)allView{
    //背景图片
    self.image1 = [[UIImageView alloc]init];
    //    self.image1.frame =CGRectMake(0, 0, 80, 80);
    [self.contentView addSubview:self.image1];
    self.image1.backgroundColor = [UIColor colorWithRed:25.0 green:147.0 blue:250.0 alpha:1.0];
    self.image1.sd_layout.leftEqualToView(self.contentView).topSpaceToView(self.contentView,1).rightEqualToView(self.contentView).heightIs(150);
    //店名
    self.nameLab = [[UILabel alloc]init];
    self.nameLab.font = [UIFont systemFontOfSize:18];
    self.nameLab.numberOfLines = 0;
    [self.image1 addSubview:self.nameLab];
    self.nameLab.backgroundColor = [UIColor greenColor];
    self.nameLab.sd_layout.leftSpaceToView(self.image1,10).topSpaceToView(self.image1,10).widthIs(360).heightIs(60);
    
    
    //星级
    self.startLab = [[UILabel alloc]init];
    [self.image1 addSubview:self.startLab];
    self.startLab.sd_layout.leftEqualToView(self.nameLab).topSpaceToView
    (self.nameLab,30).widthIs(130).heightIs(30);
    //人均消费
    self.priceLab = [[UILabel alloc]init];
    [self.image1 addSubview:self.priceLab];
    self.priceLab.sd_layout.leftSpaceToView(self.startLab,10).topEqualToView(self.startLab).widthIs(100).heightIs(30);
    //地址图片
    self.imageMap = [[UIImageView alloc]init];
    [self.contentView addSubview:self.imageMap];
    //电话图标
    self.imagePhone = [[UIImageView alloc]init];
    self.imagePhone.image = [UIImage imageNamed:@"default_groupbuying_telephone_button_normal"];
    [self.contentView addSubview:self.imagePhone];
    self.imagePhone.sd_layout.leftSpaceToView(self.contentView,10).topSpaceToView(self.addressButton,230).widthIs(40).heightIs(40);
    
    //电话
    self.phoneLab = [[UILabel alloc]init];
    [self.contentView addSubview:self.phoneLab];
    self.phoneLab.sd_layout.leftSpaceToView(self.imagePhone,10).topSpaceToView(self.addressButton,240).rightEqualToView(self.contentView).heightIs(30);
    //地址
    //    self.address = [[UILabel alloc]init];
    //    [self.contentView addSubview:self.address];
    //button
    self.addressButton = [UIButton buttonWithType:UIButtonTypeSystem];
//    self.addressButton.backgroundColor = [UIColor redColor];
    NSString *str =@"郭德纲肯定发广告的客观判断该频道改等多个";
    [self.addressButton setTitle:str forState:UIControlStateNormal];
    [self.addressButton setImage:[UIImage imageNamed:@"default_carReport_bubbleoffline"] forState:UIControlStateNormal];
    [self.addressButton addTarget:self action:@selector(addressButtonAction:) forControlEvents:UIControlEventTouchUpInside];
//    self.addressButton.titleLabel.font = [UIFont systemFontOfSize:15];
    //    [self.addressButton setBackgroundImage:[UIImage imageNamed:@"11.png"] forState:UIControlStateNormal]
    self.addressButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    self.addressButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, -10, 0);
    [self.addressButton setImage:[UIImage imageNamed:@"11.png"] forState:UIControlStateNormal];
    
    [self.contentView addSubview:self.addressButton];
    self.addressButton.sd_layout.leftEqualToView(self.image1).topSpaceToView(self.image1,20).rightEqualToView(self.image1).heightIs(50);
    
    
    
    //总评论人数
    self.allRemarks = [[UILabel alloc]init];
    [self.contentView addSubview:self.allRemarks];
    //好评人数
    self.goodRemarks = [[UILabel alloc]init];
    [self.contentView addSubview: self.goodRemarks];
    //非常好评人数
    self.veryGoodMark =[[UILabel alloc]init];
    [self.contentView addSubview:self.veryGoodMark];
    //服务评分
    self.service = [[UILabel alloc]init];
    [self.contentView addSubview:self.service];
    //差评人数
    self.badRemark = [[UILabel alloc]init];
    [self.contentView addSubview:self.badRemark];
    //非常差评人数
    self.veryBad = [[UILabel alloc]init];
    [self.contentView addSubview:self.veryBad];
    //一般评论人数
    self.commonRemark = [[UILabel alloc]init];
    [self.contentView addSubview:self.commonRemark];
    //本店特色菜
    self.diseLab = [[UILabel alloc]init];
    self.diseLab.text=@"本店特色菜:";
    self.diseLab.font = [UIFont systemFontOfSize:20];
    [self.contentView addSubview:self.diseLab];
    self.diseLab.sd_layout.leftSpaceToView(self.contentView,15).topSpaceToView(self.image1,180).rightEqualToView(self.contentView).heightIs(30);
    //推荐菜详细介绍
    self.diseLabel = [[UILabel alloc]init];
    self.diseLabel.font= [UIFont systemFontOfSize:16];
    self.diseLabel.numberOfLines=0;

    [self.contentView addSubview:self.diseLabel];
    self.diseLabel.sd_layout.leftEqualToView(self.diseLab).topSpaceToView(self.diseLab,20).rightEqualToView(self.contentView).autoHeightRatio(0);
    
    }

-(void)addressButtonAction:(UIButton *)sender{
    NSLog(@"点击了");
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
