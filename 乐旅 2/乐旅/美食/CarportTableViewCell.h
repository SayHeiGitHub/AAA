//
//  CarportTableViewCell.h
//  乐旅
//
//  Created by 姜鸥人 on 16/3/18.
//  Copyright © 2016年 姜鸥人. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CarportTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *portTP;
@property (weak, nonatomic) IBOutlet UILabel *portName;
// 停车场状态
@property (weak, nonatomic) IBOutlet UIImageView *portHOT;
// 白天价格
@property (weak, nonatomic) IBOutlet UILabel *portBTJG;
// 晚上价格
@property (weak, nonatomic) IBOutlet UILabel *portWSJG;
// 总车位
@property (weak, nonatomic) IBOutlet UILabel *portZCW;
// 空车位
@property (weak, nonatomic) IBOutlet UILabel *portKCW;
// 停车场地址
@property (weak, nonatomic) IBOutlet UILabel *portAddress;

@end
