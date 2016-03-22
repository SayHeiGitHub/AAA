//
//  BreakModel.m
//  乐旅
//
//  Created by 姜鸥人 on 16/3/21.
//  Copyright © 2016年 姜鸥人. All rights reserved.
//

#import "BreakModel.h"

@implementation BreakModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        self.Id = value;
    }
}
@end
