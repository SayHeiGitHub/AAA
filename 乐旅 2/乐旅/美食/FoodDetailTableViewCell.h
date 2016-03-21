//
//  FoodDetailTableViewCell.h
//  乐旅
//
//  Created by wumeng  on 16/3/17.
//  Copyright © 2016年 姜鸥人. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FoodDetailTableViewCell : UITableViewCell
@property(nonatomic,strong)UILabel *nameLab;//饭店名称
@property(nonatomic,strong)UILabel *startLab;//星级
@property(nonatomic,strong)UILabel *priceLab;//人均价格
@property(nonatomic,strong)UIImageView *image1;//背景图片
@property(nonatomic,strong)UIImageView *imageMap;//地图图标
@property(nonatomic,strong)UILabel *address;
@property(nonatomic,strong)UIButton *addressButton;//地址
@property(nonatomic,strong)UIImageView *imagePhone;//电话图标
@property(nonatomic,strong)UILabel *phoneLab;//电话
@property(nonatomic,strong)UILabel *diseLab;//推荐菜
@property(nonatomic,strong)UILabel *diseLabel;//推荐菜详细介绍
//@property(nonatomic,strong)UILabel *tagsLab;//饭店温馨提示
@property(nonatomic,strong)UILabel *allRemarks;//总评论人数
@property(nonatomic,strong)UILabel *goodRemarks;//好评人数
@property(nonatomic,strong)UILabel *veryGoodMark;//非常好评人数
@property(nonatomic,strong)UILabel *service;//服务评分
@property(nonatomic,strong)UILabel *badRemark;//差评人数
@property(nonatomic,strong)UILabel *veryBad;//非常差评
@property(nonatomic,strong)UILabel *commonRemark;//一般评论人数
@end
