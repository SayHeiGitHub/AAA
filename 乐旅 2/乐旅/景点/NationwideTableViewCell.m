//
//  NationwideTableViewCell.m
//  全国知名景点
//
//  Created by wumeng  on 16/3/1.
//  Copyright © 2016年 www.lanou3g.com. All rights reserved.
//

#import "NationwideTableViewCell.h"

@implementation NationwideTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self allView];
    }
    return self;
}

- (void)allView{
    //省份名字
    self.provinceName = [[UILabel alloc]initWithFrame:CGRectMake(100, 30, 300, 20)];
    self.provinceName.font=[UIFont systemFontOfSize:20];
    [self.contentView addSubview:self.provinceName];

   //景点门票数
    self.sightNum = [[UILabel alloc]initWithFrame:CGRectMake(120, 70, 200, 20)];
    self.sightNum.font=[UIFont systemFontOfSize:16];
   
    [self.contentView addSubview:self.sightNum];
    
    //风景图片
    self.imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 90, 90)];
    self.imageView1.backgroundColor=[UIColor greenColor];
    [self.contentView addSubview:self.imageView1];
    
    //小图片
    self.imageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(100, 70, 20, 20)];
    self.imageView2.image=[UIImage imageNamed:@"men.png"];
    [self.contentView addSubview:self.imageView2];
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
