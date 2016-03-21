//
//  FoodDetailTableViewController.h
//  乐旅
//
//  Created by wumeng  on 16/3/17.
//  Copyright © 2016年 姜鸥人. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FoodDetailTableViewController : UITableViewController

@property(nonatomic,strong)NSString *nameLab;//饭店名称
@property(nonatomic,strong)NSString *startLab;//星级
@property(nonatomic,strong)NSString *priceLab;//人均价格
//@property(nonatomic,strong)NSString *image1;//背景图片
//@property(nonatomic,strong)UIImageView *imageMap;//地图图标
@property(nonatomic,strong)NSString *address;
@property(nonatomic,strong)UIButton *addressButton;//地址
//@property(nonatomic,strong)UIImageView *imagePhone;//电话图标
@property(nonatomic,strong)NSString *phoneLab;//电话
@property(nonatomic,strong)NSString *diseLab;//推荐菜
@property(nonatomic,strong)NSString *diseLabel;//推荐菜详细介绍
//@property(nonatomic,strong)UILabel *tagsLab;//饭店温馨提示
@property(nonatomic,strong)NSString *allRemarks;//总评论人数
@property(nonatomic,strong)NSString *goodRemarks;//好评人数
@property(nonatomic,strong)NSString *veryGoodMark;//非常好评人数
@property(nonatomic,strong)NSString *service;//服务评分
@property(nonatomic,strong)NSString *badRemark;//差评人数
@property(nonatomic,strong)NSString *veryBad;//非常差评
@property(nonatomic,strong)NSString *commonRemark;//一般评论人数


@end
