//
//  DateHandel.h
//  乐旅
//
//  Created by 姜鸥人 on 16/3/21.
//  Copyright © 2016年 姜鸥人. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^Block)(NSMutableArray * array);
@interface DateHandel : NSObject
+ (instancetype)sharedDataHandle;

- (void)getDataWithStr:(NSString *)str Block:(Block)block;

@end
