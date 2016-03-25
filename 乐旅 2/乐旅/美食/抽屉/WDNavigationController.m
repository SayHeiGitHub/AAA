//
//  WDNavigationController.m
//  网易新闻
//
//  Created by apple on 16/3/17.
//  Copyright © 2016年 winter. All rights reserved.
//

#import "WDNavigationController.h"

@interface WDNavigationController ()

@end

@implementation WDNavigationController

+(void)initialize
{
    UINavigationBar *bar = [UINavigationBar appearance];
    [bar setBackgroundImage:[UIImage imageNamed:@"top_navigation_background"] forBarMetrics:UIBarMetricsDefault];
    bar.tintColor = [UIColor whiteColor];
}
@end
