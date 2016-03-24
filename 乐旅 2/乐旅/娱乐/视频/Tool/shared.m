//
//  shared.m
//  wangyixinwen
//
//  Created by 涛田 on 16/3/4.
//  Copyright © 2016年 涛田. All rights reserved.
//

#import "shared.h"

@implementation shared

+ (shared *)shared
{
    static shared *shard1=nil;
    static dispatch_once_t t;
    dispatch_once(&t, ^{
        shard1=[shared new];
    });
    return shard1;


}

@end
