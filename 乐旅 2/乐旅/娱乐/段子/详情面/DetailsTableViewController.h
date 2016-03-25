//
//  DetailsTableViewController.h
//  乐旅
//
//  Created by 姜鸥人 on 16/3/15.
//  Copyright © 2016年 姜鸥人. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BreakModel.h"
@interface DetailsTableViewController : UITableViewController
@property(nonatomic,strong)BreakModel *model;
//数组用于存放数据
@property(nonatomic,strong)NSMutableArray *array;
@end
