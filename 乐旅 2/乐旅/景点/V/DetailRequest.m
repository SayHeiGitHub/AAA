//
//  DetailRequest.m
//  全国知名景点
//
//  Created by wumeng  on 16/3/5.
//  Copyright © 2016年 www.lanou3g.com. All rights reserved.
//

#import "DetailRequest.h"
#import "Model.h"
@implementation DetailRequest
// 单例类创建方法
+ (DetailRequest *)shareDetailRequest{
    static DetailRequest *request0 = nil;
    static dispatch_once_t t;
    dispatch_once(&t , ^{
        request0 = [[DetailRequest alloc]init];
        
    });
    return request0;
}
//创建网络请求方法
- (NSArray *)requestWithDetailURl:(NSString *)url key1:(NSString *)key1{
       Model *model = [[Model alloc]init];
    
    
    NSMutableArray *array = [NSMutableArray new];
   //创建子线程来异步请求网络数据
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        //网址拼接
        NSString *str1 = kNationFour;
        NSString *str2 = url;
        NSString *URL = [str1 stringByAppendingString:str2];
//        NSLog(@"详情界面完整网址))))))))))%@",URL);
        NSURL *url0= [[NSURL alloc]initWithString:URL];
        
        
        //创建请求对象
        NSMutableURLRequest *requestUrl = [[NSMutableURLRequest alloc]initWithURL:url0];
        //创建会话
        NSURLSession *sessioon = [NSURLSession sharedSession];
        //创建任务
        NSURLSessionDataTask *task = [sessioon dataTaskWithRequest:requestUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            if (error == nil) {
              
//                NSString *test11 = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//                NSLog(@"%@",test11);
                
                
            NSDictionary *diction = [[NSDictionary alloc]init];
                NSError *err = nil;
                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&err];
                if (err == nil) {
                   
                   diction = dic[key1];

                    [model setValuesForKeysWithDictionary:diction];
                    [array addObject:model];
                    NSLog(@"%@",model.desc);
                    
                }
       
                
            }else{
                NSLog(@"解析失败");
            }
            
            if (self.delegate!=nil && [self.delegate respondsToSelector:@selector(reloadWithView)]) {
                [self.delegate reloadWithView];
            }
        }];
        [task resume];
    });
   
    return array;
    
    
}
@end
