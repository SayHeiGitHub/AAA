//
//  FoodRequest.m
//  ttes
//
//  Created by 涛田 on 16/3/15.
//  Copyright © 2016年 涛田. All rights reserved.
//

#import "FoodRequest.h"
#import "FoodModel.h"
#import "JHAPISDK.h"
#import "DepotModel.h"
#import "JHOpenidSupplier.h"

@implementation FoodRequest
//单例类
+ (FoodRequest *)shareFoodRequest{
    static FoodRequest *request = nil;
    static dispatch_once_t t;
    dispatch_once(&t , ^{
        request = [FoodRequest new];
    });
    return request;
}

//请求数据 按坐标
- (void)requestFoodWithLng:(NSString *)lng1 lat:(NSString *)lat1 page:(NSString *)page1 success:(void(^)(NSArray * array))success{
    // 创建一个数组接收解析的数据
    NSMutableArray *array = [NSMutableArray array];
    //创建子线程来异步请求网络数据
     dispatch_async(dispatch_get_global_queue(0, 0), ^{
         //初始化聚合数据引入 openidID
    [[JHOpenidSupplier shareSupplier] registerJuheAPIByOpenId:@"JH1a812182866ff3d71408678feaa48b74"];
         
             //按定位请求数据格式
             NSString *path = @"http://apis.juhe.cn/catering/query";
             NSString *api_id = @"45";
             NSString *method = @"GET";
             NSDictionary *param = @{@"lng":lng1,@"lat":lat1,@"page":page1, @"dtype":@"json",@"radius":@"5000"};
         
             JHAPISDK *juheapi = [JHAPISDK shareJHAPISDK];
         
             [juheapi executeWorkWithAPI:path
                                   APIID:api_id
                              Parameters:param
                                  Method:method
                                 Success:^(id responseObject){
                                     if ([[param objectForKey:@"dtype"] isEqualToString:@"xml"]) {
                                         NSLog(@"***xml*** \n %@", responseObject);
                                     }else{
                                         int error_code = [[responseObject objectForKey:@"error_code"] intValue];
                                          NSLog(@"***xml*** \n %@", responseObject);
                                         if (!error_code) {
         
                                            NSArray *arr = [[NSArray alloc]init];
                                             arr = responseObject[@"result"];
                                             for (NSDictionary *dict in arr) {
                                                 FoodModel *model = [[FoodModel alloc]init];
                                                 
                                                 [model setValuesForKeysWithDictionary:dict];
                                                 [array addObject:model];
                                             }
                                             dispatch_async(dispatch_get_main_queue(), ^{
                                                 success(array);
                                             });
                                             
                                             if (self.delegate!=nil&&[self.delegate respondsToSelector:@selector(reloadViewWithData)]) {
                                                 [self.delegate reloadViewWithData];
                                             }
                                             
                                         }else{
                                             NSLog(@"FFFFF %@", responseObject);
                                         }

                                         
                                     }
                                 } Failure:^(NSError *error) {
                                     NSLog(@"HHHHHH error:  %@",error.description);
                                 }];
         
     });

}

//请求数据 按城市
- (void)foodRequestWithCity:(NSString *)city1 page:(NSString *)page1 success:(void(^)(NSArray * array))success{
    // 创建一个数组接收解析的数据
    NSMutableArray *array = [NSMutableArray array];
    //创建子线程来异步请求网络数据
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        //初始化聚合数据引入 openidID
        [[JHOpenidSupplier shareSupplier] registerJuheAPIByOpenId:@"JH1a812182866ff3d71408678feaa48b74"];
                      
        NSString *path = @"http://apis.juhe.cn/catering/querybycity";
        NSString *api_id = @"45";
        NSString *method = @"GET";
        NSDictionary *param = @{@"city":city1,@"pagesize":@"20", @"dtype":@"JSON",@"page":page1};
        JHAPISDK *juheapi = [JHAPISDK shareJHAPISDK];
        
        [juheapi executeWorkWithAPI:path
                APIID:api_id
                Parameters:param
                Method:method
                Success:^(id responseObject){
                if ([[param objectForKey:@"dtype"] isEqualToString:@"xml"]) {
                NSLog(@"***xml*** \n %@", responseObject);
                }else{
                int error_code = [[responseObject objectForKey:@"error_code"] intValue];
                if (!error_code) {
           //JSON格式请求下的数据
//                NSLog(@"!!!!!! %@", responseObject);
               NSArray *arr = [[NSArray alloc]init];
                    //判断是否存在输入的城市
                    id obj = [responseObject objectForKey:@"result"];
                    //如果不存在要查找的城市
                    if ([obj isEqual:[NSNull null]]) {
                        
                        FoodModel *model = [[FoodModel alloc]init];
                        [model setValue:@"你是不是傻" forKey:@"name"];
                        [array addObject:model];
                      
                    }
                    //如果存在
                    else{
               arr = responseObject[@"result"];
            for (NSDictionary *dict in arr) {
            FoodModel *model = [[FoodModel alloc]init];
            [model setValuesForKeysWithDictionary:dict];
                [array addObject:model];
            }
                        dispatch_async(dispatch_get_main_queue(), ^{
                            success(array);
                        });

            }
                    }
            if (self.delegate!=nil&&[self.delegate respondsToSelector:@selector(reloadViewWithData)]) {
                        [self.delegate reloadViewWithData];
                
            }else{
            NSLog(@"FFFFF %@", responseObject);
            }
            }
            } Failure:^(NSError *error) {
            NSLog(@"HHHHHH error:  %@",error.description);
            }];
        
        
           });

}


//////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////



// 所有的所有的所有的所有的网络请求       返回值都是void  然后, 有第一个参数,就是传进来的URL, 第二个参数就是block (这个block: 1. 刷新数据, 2. 传递数据)



    //根据坐标获取停车场数据
- (void)requestDepotWithLng:(NSString *)lng1 lat:(NSString *)lat1 success:(void(^)(NSArray * array))success{
        // 创建一个数组接收解析的数据
    
        NSMutableArray *array = [NSMutableArray array];
        //创建子线程来异步请求网络数据
//        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            //初始化聚合数据引入 openidID
            [[JHOpenidSupplier shareSupplier] registerJuheAPIByOpenId:@"JH6be733290579ff8e3710208ce5bb1dd5"];
                NSString *path = @"http://japi.juhe.cn/park/nearPark.from";
                NSString *api_id = @"133";
                NSString *method = @"GET";
                //JD float 经度
                //WD float 纬度
   NSDictionary *param = @{@"JD":lng1,@"WD":lat1,@"dtype":@"json",@"JLCX":@"150"};
                JHAPISDK *juheapi = [JHAPISDK shareJHAPISDK];
     [juheapi executeWorkWithAPI:path
                          APIID:api_id
                        Parameters:param
                        Method:method
                        Success:^(id responseObject){
                                        if ([[param objectForKey:@"dtype"] isEqualToString:@"xml"]) {
//                                            NSLog(@"***xml*** \n %@", responseObject);
                                        }else{
                                            int error_code = [[responseObject objectForKey:@"error_code"] intValue];
                                            NSMutableArray *array1 = [[NSMutableArray alloc]init];
                                            if (!error_code) {
                                                NSArray *arr = [[NSArray alloc]init];
                                                arr = responseObject[@"result"];
                                                for (NSDictionary *dict in arr) {
                                                    DepotModel *model = [[DepotModel alloc]init];
                                                    
                                                    [model setValuesForKeysWithDictionary:dict];
                                                    NSString *str = model.CCID;
//                                                    NSLog(@"qqqqqqqqqqq%@",str);
                                                    [array1 addObject:str];
                                                    
                                                }
                                     
                                for (int i = 0; i<array1.count; i++) {
                                            NSString *path = @"http://japi.juhe.cn/park/baseInfo.from";
                                            NSString *api_id = @"133";
                                            NSString *method = @"GET";
                                            NSDictionary *param = @{@"CCID":array1[i],@"dtype":@"json",@"JLCX":@"150"};
                                            JHAPISDK *juheapi = [JHAPISDK shareJHAPISDK];
                                            [juheapi executeWorkWithAPI:path
                                                                  APIID:api_id
                                                             Parameters:param
                                                                 Method:method
                                                                Success:^(id responseObject){
                                                                    if ([[param objectForKey:@"dtype"] isEqualToString:@"xml"]) {
                                                                        NSLog(@"======***xml*** \n %@", responseObject);
                                                                    }else{
                                                                        int error_code = [[responseObject objectForKey:@"error_code"] intValue];
                                                                        if (!error_code) {
                                                                            NSArray *arr1 = [[NSArray alloc]init];
                                                                            arr1 = responseObject[@"result"];
                                                                            for (NSDictionary *dict in arr1) {
                                                                                DepotModel *model = [[DepotModel alloc]init];
                                    
                                                                                [model setValuesForKeysWithDictionary:dict];
                                                                                if ([model.SFKF isEqualToString:@"1"]) {
                                                                                    [array addObject:model];
                                                                                }
                                                                                dispatch_async(dispatch_get_main_queue(), ^{
                                                                                    success(array);
                                                                                    
                                                                                });
                                                                                if (self.delegate!=nil&&[self.delegate respondsToSelector:@selector(reloadViewWithData)]) {
                                                                                    [self.delegate reloadViewWithData];
                                                                                }
                                                                         }
                                                                       }
                                                                    }
                                                                    
                                                                }

                                                                Failure:^(NSError *error) {

                                                                }];
  
                                                    }

                                            } else{

                                            }
                                        }
                                    } Failure:^(NSError *error) {
  
                                    }];

    }
@end
