//
//  FoodTableViewCell.h
//  乐旅
//
//  Created by 姜鸥人 on 16/3/16.
//  Copyright © 2016年 姜鸥人. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FoodTableViewCell : UITableViewCell

@property(nonatomic,strong)UIImageView *FoodImage;
@property(nonatomic,strong)UILabel *FoodName;
@property(nonatomic,strong)UILabel *tagsLab;//饭店温馨提示
@property(nonatomic,strong)UILabel *staLab;//星级
@property(nonatomic,strong)UILabel *avgLab;//人均消费
@property(nonatomic,strong)UIImageView *backImage;//整个背景图片

@end
