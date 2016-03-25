//
//  Request.h
//  全国知名景点
//
//  Created by wumeng  on 16/3/2.
//  Copyright © 2016年 www.lanou3g.com. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol NationwideRequestDelegate<NSObject>

- (void)reloadViewWithData;
@end


@interface Request : NSObject
//创建自身代理属性
@property(nonatomic,weak)id<NationwideRequestDelegate>delegate;
// 单例类创建方法
+ (Request *)shareNationwideRequest;
//创建网络请求方法
- (NSArray *)requestWithNationwideURl:(NSString *)url urrl:(NSString *)urrl  key1:(NSString *)key1;

@end
