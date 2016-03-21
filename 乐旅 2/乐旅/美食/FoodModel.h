//
//  FoodModel.h
//  ttes
//
//  Created by wumeng  on 16/3/15.
//  Copyright © 2016年 涛田. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FoodModel : NSObject
@property(nonatomic,strong)NSString *name;//店名
@property(nonatomic,strong)NSString *city;//所属城市
@property(nonatomic,strong)NSString *area;//所属区域
@property(nonatomic,strong)NSString *address;//详细地址
@property(nonatomic,strong)NSString *phone;//联系电话
@property(nonatomic,strong)NSString *photos;//图片地址
@property(nonatomic,assign)float  latitude;//坐标纬度
@property(nonatomic,assign)float longitude;//坐标经度
@property(nonatomic,assign)float stars;//星级
@property(nonatomic,strong)NSString *avg_price;//人均消费
@property(nonatomic,assign)int all_remarks;//点评人数
@property(nonatomic,strong)NSString *recommended_dishes;//推荐菜色
@property(nonatomic,strong)NSString *nearby_shops;//周边美食
@property(nonatomic,strong)NSString *service_rating;//服务评分
@property(nonatomic,strong)NSString *tags; //温馨提示
@property(nonatomic,assign)int  very_good_remarks;//非常好评人数
@property(nonatomic,assign)int good_remarks;//好评人数
@property(nonatomic,assign)int  bad_remarks;//差评
@property(nonatomic,assign)int very_bad_remarks;//特别差评
@property(nonatomic,assign)int common_remarks;//一般评论
@end
