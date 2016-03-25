//
//  DetailRequest.h
//  全国知名景点
//
//  Created by wumeng  on 16/3/5.
//  Copyright © 2016年 www.lanou3g.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DeltailDelegate <NSObject>

- (void)reloadWithView;

@end
@class Model;
@interface DetailRequest : NSObject
// 单例类创建方法
+ (DetailRequest *)shareDetailRequest;
//创建网络请求方法
- (NSArray *)requestWithDetailURl:(NSString *)url key1:(NSString *)key1;

//代理属性
@property(nonatomic,weak)id<DeltailDelegate>delegate;
@end
