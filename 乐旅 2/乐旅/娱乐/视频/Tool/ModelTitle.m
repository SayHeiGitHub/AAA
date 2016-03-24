//
//  ModelTitle.m
//  wangyixinwen
//
//  Created by 涛田 on 16/3/3.
//  Copyright © 2016年 涛田. All rights reserved.
//

#import "ModelTitle.h"

@implementation ModelTitle


- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"description"]) {
        self.Description=value;
    }
    
}



- (id)valueForUndefinedKey:(NSString *)key
{
    return nil;
}
@end
