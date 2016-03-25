//
//  NationwideTableViewCell.h
//  全国知名景点
//
//  Created by wumeng  on 16/3/1.
//  Copyright © 2016年 www.lanou3g.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NationwideTableViewCell : UITableViewCell
@property(nonatomic,strong)UILabel *provinceName;//省份
@property(nonatomic,strong)UIImageView *imageView1;//图片
@property(nonatomic,strong)UILabel *areaNum;
@property(nonatomic,assign)NSInteger num;//区域个数
@property(nonatomic,strong)UILabel *sightNum;//景点门票数
@property(nonatomic,strong)UIImageView *imageView2;//小图片
@property(nonatomic,strong)NSString *iid;
@end
