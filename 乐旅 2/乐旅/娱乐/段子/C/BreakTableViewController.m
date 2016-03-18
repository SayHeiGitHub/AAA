//
//  BreakTableViewController.m
//  乐旅
//
//  Created by 姜鸥人 on 16/3/14.
//  Copyright © 2016年 姜鸥人. All rights reserved.
//

#import "BreakTableViewController.h"
#import "DetailsTableViewController.h"
#import "BreakTableViewCell.h"
#import "BreakImageViewCell.h"
@interface BreakTableViewController ()

@end

@implementation BreakTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    
    // 马上进入刷新状态
    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];

}

- (void)loadNewData{
    [self.tableView reloadData];
    [self.tableView.mj_header endRefreshing];
}

-(void)loadMoreData{
    [self.tableView reloadData];
    [self.tableView.mj_footer endRefreshing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    [self.tableView startAutoCellHeightWithCellClass:[BreakTableViewCell class] contentViewWidth:KWindowWidth];
    
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    static NSString *cell_id = @"cell";
    BreakImageViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cell_id];
    if (!cell) {
        cell = [[BreakImageViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cell_id];
    }
    cell.userContentLabel.text =@"daffsd加进来就快乐健康健康科技始的hdfj";
    [cell.shareBtn addTarget:self action:@selector(shareBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}
// 分享按钮
-(void)shareBtnAction:(UIButton *)sender{
    NSLog(@"分享");
}
// 点击cell 跳转页面
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DetailsTableViewController *DTVC = [[DetailsTableViewController alloc ]init];
    
    [self.navigationController pushViewController:DTVC animated:YES];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
  
    
    
    return  220;
}


@end
