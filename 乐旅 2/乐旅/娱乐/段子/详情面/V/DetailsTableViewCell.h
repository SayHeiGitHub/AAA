//
//  DetailsTableViewCell.h
//  乐旅
//
//  Created by 姜鸥人 on 16/3/15.
//  Copyright © 2016年 姜鸥人. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailsTableViewCell : UITableViewCell
@property(nonatomic,strong)UIImageView *userImageView; // 用户头像
@property(nonatomic,strong)UILabel *userName;  // 用户名
@property(nonatomic,strong)UILabel *floor;  //楼
@property(nonatomic,strong)UILabel *userContentLabel; // 内容
@property(nonatomic,strong)UILabel *time;  // 时间
@end
