//
//  DateRequest.m
//  wangyixinwen
//
//  Created by 涛田 on 16/3/3.
//  Copyright © 2016年 涛田. All rights reserved.
//

#import "DateRequest.h"
#import "ModelTitle.h"
@implementation DateRequest


//单例类的创建方式 GCD模式

+ (DateRequest *)shareDateRequest
{
    static DateRequest *date=nil;
    static dispatch_once_t t;
    dispatch_once(&t,
                  ^{
                      date=[DateRequest new];
                  
                  
                  });
    return date;

}

- (NSArray *)requestWithDateUrl:(NSString *)url
{
  //创建一个数组用来接收数据
    NSMutableArray *array=[NSMutableArray array];
    //创建子线程
    dispatch_async(dispatch_get_global_queue(0,0), ^{

    NSURL *url1=[[NSURL alloc]initWithString:url];
    //创建请求对象
    NSMutableURLRequest *request=[[NSMutableURLRequest alloc]initWithURL:url1];
    //创建会话
    NSURLSession *session=[NSURLSession sharedSession];
    //创建任务
    NSURLSessionDataTask *task=[session dataTaskWithRequest:request  completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
     //   NSLog(@"%@",data);
            if (nil==error) {
                NSError *err=nil;
                NSMutableDictionary *dic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&err];
                if (nil==err) {
                  //  NSArray *videoSidListArr=dic[@"videoSidList"];
                    NSArray *videoListArr=dic[@"videoList"];
//                    NSMutableArray *SidArr=[NSMutableArray array];
//                    for (NSDictionary *d in videoSidListArr) {
//                        ModelTitle *model=[ModelTitle alloc];
//                        [model setValuesForKeysWithDictionary:d];
//                        [SidArr addObject:model];
//                    }
//                    [array addObject:SidArr];
                    for (NSDictionary *d in videoListArr) {
                        ModelTitle *model=[ModelTitle alloc];
                        [model setValuesForKeysWithDictionary:d];
                        [array addObject:model];
                    }
                    
               //     NSLog(@"5555555%@",array);
                    if (array.count!=0) {
                        dispatch_async(dispatch_get_main_queue(), ^{
                            [self.delegate reloadViewWithData];
                        });
                    }
                    else{
                        NSLog(@"没有数据");
                    }
                }
                else
                {
                    NSLog(@"解析error=%@",error);
                }
        };
      
        }];
     [task resume];
    });
      return array;
}
    

@end
