//
//  DateRequest.h
//  wangyixinwen
//
//  Created by 涛田 on 16/3/3.
//  Copyright © 2016年 涛田. All rights reserved.
//

#import <Foundation/Foundation.h>
//创建代理方法刷新请求下后界面
@protocol DateRequestDelegate <NSObject>

- (void)reloadViewWithData;

@end
@interface DateRequest : NSObject

@property (nonatomic,weak)id<DateRequestDelegate>delegate;

+ (DateRequest *)shareDateRequest;

//建立网络请求方法

- (NSArray *)requestWithDateUrl:(NSString *)url;

@end
