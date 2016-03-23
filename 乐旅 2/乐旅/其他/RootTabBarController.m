//
//  RootTabBarController.m
//  乐旅
//
//  Created by 姜鸥人 on 16/3/14.
//  Copyright © 2016年 姜鸥人. All rights reserved.
//

#import "RootTabBarController.h"

//#import "NewTableViewController.h"
//#import "PivterTableViewController.h"
//#import "VedioTableViewController.h"
//#import "BreakTableViewController.h"

#import "FoodTableViewController.h"
#import "MeTableViewController.h"
#import "ScenicTableViewController.h"
#import "RecreationViewController.h"


@interface RootTabBarController ()

@property(nonatomic,strong)UISegmentedControl *segment;


@end

@implementation RootTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    RecreationViewController * vc3 = [[RecreationViewController alloc]init];
     [self addOneChildVC:vc3 title:@"娱乐"];
 
    FoodTableViewController * vc = [[FoodTableViewController alloc]init];
    [self addOneChildVC:vc title:@"美食"];

    ScenicTableViewController * vc1 = [[ScenicTableViewController alloc]init];
    [self addOneChildVC:vc1 title:@"景点"];
  
    MeTableViewController *vc2 = [[MeTableViewController alloc]init];
    [self addOneChildVC:vc2 title:@"我"];


    
  //  self.navigationItem.title = self.tabBarItem.title;.
 }


- (void)addOneChildVC:(UIViewController *)childVC title:(NSString *)title
{
    //设置标题
    childVC.title = title;
    UINavigationController *naVC = [[UINavigationController alloc] initWithRootViewController:childVC];
    [self addChildViewController:naVC];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
