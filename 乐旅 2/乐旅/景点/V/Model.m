//
//  Model.m
//  全国知名景点
//
//  Created by wumeng  on 16/3/1.
//  Copyright © 2016年 www.lanou3g.com. All rights reserved.
//

#import "Model.h"

@implementation Model

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ %@ %@", self.namec,self.iid,self.desc];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        self.iid = value;
    }
}

- (id)valueForUndefinedKey:(NSString *)key{
    return nil;
}
@end
