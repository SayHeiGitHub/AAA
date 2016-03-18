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
- (NSString *)description
{
    return [NSString stringWithFormat:@"店名:%@ 所属城市:%@ 所属区域:%@ 详细地址:%@ 联系电话:%@ 人均消费:%@ 图片地址:%@ 服务评分:%@ 推荐菜色:%@ 周边美食:%@ 经度:%f 纬度:%f 星级:%f 总点评人数:%d", self.name,self.city,self.area,self.address,self.phone,self.avg_price,self.photos,self.service_rating,self.recommended_dishes,self.nearby_shops,self.latitude,self.longitude,self.stars,self.all_remarks];
}

@end
