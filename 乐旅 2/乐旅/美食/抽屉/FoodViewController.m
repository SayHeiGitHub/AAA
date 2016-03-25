//
//  FoodViewController.m
//  乐旅
//
//  Created by wumeng  on 16/3/23.
//  Copyright © 2016年 姜鸥人. All rights reserved.
//

#import "FoodViewController.h"
#import "WDLeftView.h"
#import "WDNavigationController.h"
#import "UIBarButtonItem+Extension.h"
#import "UIView+SHCZExt.h"
#import "FoodTableViewController.h"
#import "MyFavoriteViewController.h"
@interface FoodViewController ()<WDLeftViewDelegate>
@property(nonatomic,weak)UIButton *btn;
@property (nonatomic, strong) UIViewController *vc;
@property (nonatomic, strong) WDNavigationController *nav;
@property(nonatomic,weak)UIButton *button;

@end

@implementation FoodViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置左侧菜单
    WDLeftView *left = [[WDLeftView alloc] init];
    left.delegate = self;
    [self.view addSubview:left];
    CGFloat leftW = 0.6 * self.view.frame.size.width;
    CGFloat leftH = 0.6 * self.view.frame.size.height;
    CGFloat leftY = 0.1 * self.view.frame.size.height;
    self.view.userInteractionEnabled = YES;
    left.frame = CGRectMake(0, leftY, leftW, leftH);
    //包装导航控制器
    
    self.vc = [[FoodTableViewController alloc]init];
    self.nav = [[WDNavigationController alloc] initWithRootViewController:self.vc];
    [self addChildViewController:self.nav];
    [self.view addSubview:self.nav.view];
    self.nav.view.frame = self.view.bounds;
    
   
//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
//    imageView.contentMode = UIViewContentModeScaleToFill;
//    [imageView setImage:[UIImage imageNamed:@"sidebar_bg.jpg"]];
//    [self.view addSubview:imageView];
 }


-(void)leftBtnDidClicked:(int)tag
{
    switch (tag) {
        case 0:
            self.vc = [[FoodTableViewController alloc] init];
            [self setUpNavigationController:self.vc];
            break;
        case 1:
            self.vc = [[MyFavoriteViewController alloc] init];
            [self setUpNavigationController:self.vc];
//            break;
//        case 2:
//            self.vc = [[WDTableViewPhoto alloc] init];
//            [self setUpNavigationController:self.vc];
//            break;
//        case 3:
//            self.vc = [[WDTableViewRadio alloc] init];
//            [self setUpNavigationController:self.vc];
//            break;
//        case 4:
//            self.vc = [[WDTableViewComment alloc] init];
//            [self setUpNavigationController:self.vc];
//            break;
//        case 5:
//            self.vc = [[WDTableViewSounds alloc] init];
//            [self setUpNavigationController:self.vc];
//        case 6:
//            self.vc = [[WDTableViewNews alloc]init];
//            [self setUpNavigationController:self.vc];
        default:
            break;
    }
}

- (void)setUpNavigationController:(UIViewController *)vc
{
    self.nav = [self.nav initWithRootViewController:vc];
    [self addChildViewController:self.nav];
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
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
