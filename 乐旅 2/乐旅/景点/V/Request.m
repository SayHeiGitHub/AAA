//
//  Request.m
//  全国知名景点
//
//  Created by wumeng  on 16/3/2.
//  Copyright © 2016年 www.lanou3g.com. All rights reserved.
//

#import "Request.h"
#import "Model.h"
@implementation Request
// 单例类创建方法
+ (Request *)shareNationwideRequest{
    static Request *request = nil;
    static dispatch_once_t t;
    dispatch_once(&t , ^{
        request = [Request new];
    });
    return request;
    
    
}
//创建网络请求方法
- (NSArray *)requestWithNationwideURl:(NSString *)url urrl:(NSString *)urrl key1:(NSString *)key1{
    //创建一个数组接收url解析的数据
    NSMutableArray *array = [NSMutableArray array];
    //创建子线程来异步请求网络数据
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        //网址拼接
        NSString *str1 = kqq;
        NSString *str2= url;
        NSString *str3 = urrl;
        NSString *URL = [str1 stringByAppendingString:str2];
        URL = [URL stringByAppendingString:str3];
        NSLog(@"%@",URL);
        //请求网址
        NSURL *urll = [[NSURL alloc]initWithString:URL];
        // 创建请求对象
        NSMutableURLRequest *requestUrl= [[NSMutableURLRequest alloc]initWithURL:urll];
        //创建会话
        NSURLSession *session = [NSURLSession sharedSession];
        //创建任务
        NSURLSessionDataTask *task = [session dataTaskWithRequest:requestUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            NSLog(@"%@",data);
            if (nil==error) {
                //请求成功 解析数据
                NSError *err = nil;
                NSDictionary *dic= [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&err];
                
                        if (err==nil) {
                    NSArray *arr=[[NSArray alloc]init];

                        if ([key1 isEqualToString:@"pageBean"])
                     {
                        NSDictionary *dic2 = dic[key1];
                        arr = dic2[@"resultList"];
                         
                    }
                    else{
                        arr =dic[key1];
                    }
                    
                    for (NSDictionary *dict in arr) {
                        Model *model = [[Model alloc]init];
                        // 将字典通过KVC转化为model
            [model setValuesForKeysWithDictionary:dict];
                        [array addObject:model];
                        
                    }
                }else{
                    NSLog(@"解析失败");
                }
                if (self.delegate !=nil&&[self.delegate respondsToSelector:@selector(reloadViewWithData)]) {
                    [self.delegate reloadViewWithData];
                }
            }
        }];
        // 执行任务
            [task resume];

    });
    return array;
 }











@end
