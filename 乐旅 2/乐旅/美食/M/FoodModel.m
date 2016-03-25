//
//  FoodModel.m
//  ttes
//
//  Created by wumeng  on 16/3/15.
//  Copyright © 2016年 涛田. All rights reserved.
//

#import "FoodModel.h"

@implementation FoodModel

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"address"]) {
        self.address = value;
    }
    if ([key isEqualToString:@"city"]) {
        self.city = value;
    }
}

-(id)valueForUndefinedKey:(NSString *)key{
    return nil;
}



- (void)setNilValueForKey:(NSString *)key{
    
}
//- (NSString *)description
//{
//return [NSString stringWithFormat:@"店名:%@ 所属城市:%@ 所属区域:%@ 详细地址:%@ 联系电话:%@ 图片地址:%@ 周边美食:%@ 经度:%f 纬度:%f 总点评人数:%d 星级:%f 人均消费%@ 推荐彩色:%@ 服务评分%@ 非常好评人数%d 好评人数%d 差评%d 特别差评%d 一般评论%d %@", self.name,self.city,self.area,self.address,self.phone,self.photos,self.nearby_shops,self.latitude,self.longitude,self.all_remarks,self.stars,self.avg_price,self.recommended_dishes,self.service_rating,self.very_good_remarks,self.good_remarks,self.bad_remarks,self.very_bad_remarks,self.common_remarks,self.tags];
//}

@end
