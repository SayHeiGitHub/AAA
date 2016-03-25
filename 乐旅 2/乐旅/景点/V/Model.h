//
//  Model.h
//  全国知名景点
//
//  Created by wumeng  on 16/3/1.
//  Copyright © 2016年 www.lanou3g.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject
@property(nonatomic,strong)NSString *namec;
@property(nonatomic,strong)NSString *pic;//图片网址
@property(nonatomic,strong)NSString *sellSightCount;//景点门票
@property(nonatomic,strong)NSString *count;//区域个数
@property(nonatomic,strong)NSString *iid;
@property(nonatomic,strong)NSString *desc;//详情界面
@property(nonatomic,strong)NSString *sightCount;

//景区活动
@property(nonatomic,strong)NSString *name;//签名
@property(nonatomic,strong)NSString *content;//详情
@property(nonatomic,strong)NSString *time;//时间
@property(nonatomic,strong)NSString *showImag;//图片

@end

