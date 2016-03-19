//
//  FoodRequest.h
//  ttes
//
//  Created by 涛田 on 16/3/15.
//  Copyright © 2016年 涛田. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol FootRequestDalegate <NSObject>

- (void)reloadViewWithData;

@end

@interface FoodRequest : NSObject
//创建自身代理属性
@property(nonatomic,weak)id<FootRequestDalegate>delegate;

//单例类
+ (FoodRequest *)shareFoodRequest;

//请求数据 按坐标
- (void)requestFoodWithLng:(NSString *)lng1 lat:(NSString *)lat1 page:(NSString *)page1 success:(void(^)(NSArray * array))success;

//请求数据 按城市
- (void)foodRequestWithCity:(NSString *)city1 page:(NSString *)page1 success:(void(^)(NSArray * array))success;

//根据坐标获取停车场数据
- (void)requestDepotWithLng:(NSString *)lng1 lat:(NSString *)lat1 success:(void(^)(NSArray * array))success;
//获取停车场的基本信息
//- (NSArray *)depotRequestWithCCID:(NSString *)CCID1;

@end
