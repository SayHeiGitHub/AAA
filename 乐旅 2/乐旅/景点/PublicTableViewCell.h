//
//  PublicTableViewCell.h
//  全国知名景点
//
//  Created by wumeng  on 16/3/4.
//  Copyright © 2016年 www.lanou3g.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PublicTableViewCell : UITableViewCell
@property(nonatomic,strong)UILabel *detailLab;
//自适应高度
+ (CGFloat)heithForLabelText:(NSString *)text;

@end
