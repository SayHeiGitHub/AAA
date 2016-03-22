//
//  BreakModel.h
//  乐旅
//
//  Created by 姜鸥人 on 16/3/21.
//  Copyright © 2016年 姜鸥人. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BreakModel : NSObject
@property(nonatomic,strong)NSString *content;
@property(nonatomic,strong)NSString *created_at;
@property(nonatomic,strong)NSString *comments_count;
@property(nonatomic,strong)NSString *format;
@property(nonatomic,strong)NSString *Id;
@property(nonatomic,strong)NSString *image;
@property(nonatomic,strong)NSDictionary *image_size;
@property(strong,nonatomic)NSString *share_count;
@property(nonatomic,strong)NSString *type;
@property(nonatomic,strong)NSDictionary *user;
@property(nonatomic,strong)NSDictionary *votes;
@property(nonatomic,strong)NSArray *items;
@end
