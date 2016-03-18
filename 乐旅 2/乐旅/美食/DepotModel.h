//
//  DepotModel.h
//  ttes
//
//  Created by wumeng  on 16/3/16.
//  Copyright © 2016年 涛田. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DepotModel : NSObject
@property(nonatomic,strong)NSString *CCID;//停车场ID
@property(nonatomic,strong)NSString *KCWZT;//停车场空车位状态图片
@property(nonatomic,strong)NSString *CCMC;//停车场名称
@property(nonatomic,strong)NSString *CCDZ;//停车场地址
@property(nonatomic,strong)NSString *ZCW;//总车位
@property(nonatomic,strong)NSString *KCW;//空车位
@property(nonatomic,strong)NSString *CCFL;//停车场分类
@property(nonatomic,strong)NSString *CCLX;//停车场类型
@property(nonatomic,strong)NSString *CCTP;//停车场图片
@property(nonatomic,assign)float JD; //停车场坐标-经度
@property(nonatomic,assign)float WD;//停车场坐标-纬度


@property(nonatomic,strong)NSString *BTTCJG ;//白天停车价格
@property(nonatomic,strong)NSString *WSTCJG ;//晚上停车价格
@property(nonatomic,strong)NSString *YYKSSJ ;//营业开始时间（示例：06:00:00）
@property(nonatomic,strong)NSString *YYJSSJ ;//营业结束时间（示例：19:00:00）
@property(nonatomic,strong)NSString *SFKF ;//是否开放(0：不开放；1：开放；)
@property(nonatomic,strong)NSString *QYCS ;//区域

//@property(nonatomic,strong)NSString *JCSFA ;//计次收费-大型车
//@property(nonatomic,strong)NSString *JCSFB ;//计次收费-小型车
//@property(nonatomic,strong)NSString * ;//
@end
