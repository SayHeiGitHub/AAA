//
//  DateHandel.m
//  乐旅
//
//  Created by 姜鸥人 on 16/3/21.
//  Copyright © 2016年 姜鸥人. All rights reserved.
//

#import "DateHandel.h"
#import "BreakModel.h"


@interface DateHandel ()


@end
@implementation DateHandel




+ (instancetype)sharedDataHandle{
    static DateHandel *datehandel = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        datehandel = [[DateHandel alloc]init];
    });
    return datehandel;

}



- (void)getDataWithStr:(NSString *)str Block:(Block)block{
//        __weak typeof(self)weakSelf = self;
    AFHTTPSessionManager  *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    NSMutableArray *arrr = [NSMutableArray array];
    [manager GET:str parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSArray *arr = responseObject[@"items"];
        for (NSDictionary *d in arr) {
            //将字典通过KVC转化成model

            BreakModel *model = [[BreakModel alloc] init];
            [model setValuesForKeysWithDictionary:d];
            [arrr addObject:model];

        }
//        dispatch_async(dispatch_get_main_queue(), ^{
//            //刷新数据
//            weakSelf.reloadDataBlock();
//            
//        });
        block(arrr);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
    
}

@end
