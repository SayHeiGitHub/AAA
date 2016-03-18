//
//  DepotModel.m
//  ttes
//
//  Created by wumeng  on 16/3/16.
//  Copyright © 2016年 涛田. All rights reserved.
//

#import "DepotModel.h"

@implementation DepotModel
- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ %@ %@ %@ %@ %@ %@ %@ %@ %f %f %@ %@ %@ %@ 是否开放:%@ %@", self.CCID,self.KCWZT,self.CCMC,self.CCDZ,self.ZCW,self.KCW,self.CCFL,self.CCLX,self.CCTP,self.JD,self.WD,self.BTTCJG,self.WSTCJG,self.YYJSSJ,self.YYKSSJ,self.SFKF,self.QYCS];
}



-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
//    if ([key isEqualToString:@"JCSFA"]) {
//        self.JCSFA = value;
//    }
//    if ([key isEqualToString:@"city"]) {
//        self.city = value;
//    }
}

-(id)valueForUndefinedKey:(NSString *)key{
    return nil;
}


- (void)setNilValueForKey:(NSString *)key{
    
}

@end
