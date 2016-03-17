//
//  RecreationViewController.m
//  乐旅
//
//  Created by 姜鸥人 on 16/3/14.
//  Copyright © 2016年 姜鸥人. All rights reserved.
//

#import "RecreationViewController.h"
#import "NewTableViewController.h"
#import "PivterTableViewController.h"
#import "VedioTableViewController.h"
#import "BreakTableViewController.h"
#import <UIView+SDAutoLayout.h>
#import <UITableView+SDAutoTableViewCellHeight.h>

@interface RecreationViewController ()<UIScrollViewDelegate>
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UISegmentedControl *segment;

@end

@implementation RecreationViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self AutoLayout];

}

-(void)AutoLayout{
    
    UISegmentedControl  *segment = [[UISegmentedControl alloc]initWithItems:@[@"段子",@"视频",@"图片",@"新闻"]];
    segment.selectedSegmentIndex = 0;
    self.segment =segment;
    segment.frame = CGRectMake(0, 64, KWindowWidth, 30);
    [self.view addSubview:segment];
    self.automaticallyAdjustsScrollViewInsets = NO;
    // 添加事件
    [segment addTarget:self action:@selector(segmentControlAction:) forControlEvents:UIControlEventValueChanged];
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 94, self.view.frame.size.width,KWindowHeight)];
    //    UIScrollView *scrollView = [UIScrollView new];
    
    //    scrollView.sd_layout.topSpaceToView(segment,0).leftSpaceToView(self.view,0).rightSpaceToView(self.view,0).heightIs(300);
    scrollView.contentSize =CGSizeMake(KWindowWidth * 4,scrollView.frame.size.height);
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    //    [scrollView setupAutoContentSizeWithRightView:self.view rightMargin:0];
    self.scrollView = scrollView;
    BreakTableViewController *breakVC = [[BreakTableViewController alloc]initWithStyle:UITableViewStylePlain];
    breakVC.view.frame = CGRectMake(0, 0,  scrollView.size.width, KWindowHeight);
    [scrollView addSubview:breakVC.view];
    VedioTableViewController *VedioVC = [[VedioTableViewController alloc]initWithStyle:UITableViewStylePlain];
    VedioVC.tableView.frame = CGRectMake(KWindowWidth *1 , 0,  scrollView.size.width, KWindowHeight);
    [scrollView addSubview:VedioVC.tableView];
    
    PivterTableViewController *PicVC = [[PivterTableViewController alloc]initWithStyle:UITableViewStylePlain];
    PicVC.view.frame = CGRectMake(KWindowWidth *2, 0,  scrollView.size.width, KWindowHeight);
    
    [scrollView addSubview:PicVC.view];
    
    NewTableViewController *NewVC = [[NewTableViewController alloc]initWithStyle:UITableViewStylePlain];
    NewVC.view.frame = CGRectMake(KWindowWidth *3, 0, scrollView.size.width, KWindowHeight);
    [scrollView addSubview:NewVC.tableView];
    
    // !!!: 如果父视图管理的子视图由另外的controller管理, 那父视图的控制器也必须管理子视图的controller
    
    [self addChildViewController:NewVC];
    [self addChildViewController:VedioVC];
    [self addChildViewController:PicVC];
    [self addChildViewController:breakVC];
    
    [self.view addSubview:scrollView];
    self.scrollView.delegate =self;
   
}

-(void)segmentControlAction:(UISegmentedControl *)sender{
    
     self.scrollView.contentOffset = CGPointMake(KWindowWidth *sender.selectedSegmentIndex, 0);
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    // 设置segment的selectedSegmentIntdex 值
self.segment.selectedSegmentIndex = self.scrollView.contentOffset.x/KWindowWidth;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
