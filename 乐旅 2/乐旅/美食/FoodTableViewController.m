//
//  FoodTableViewController.m
//  乐旅
//
//  Created by 姜鸥人 on 16/3/14.
//  Copyright © 2016年 姜鸥人. All rights reserved.
//

#import "FoodTableViewController.h"
#import "FoodTableViewCell.h"
#import "CarportTableViewController.h"
@interface FoodTableViewController ()

@end

@implementation FoodTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
     self.navigationItem.title = @"美食";
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    
    // 马上进入刷新状态
    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithTitle:@"车库" style:UIBarButtonItemStylePlain target:self action:@selector(rightAction:)];
    self.navigationItem.rightBarButtonItem = right;
    
    
}
- (void)loadNewData{
    [self.tableView reloadData];
    [self.tableView.mj_header endRefreshing];
}

-(void)loadMoreData{
    [self.tableView reloadData];
    [self.tableView.mj_footer endRefreshing];
}

// 点击车库按钮
-(void)rightAction:(UIBarButtonItem *)sender{
    CarportTableViewController *CarVC = [[CarportTableViewController alloc]init];
    [self.navigationController pushViewController:CarVC animated:YES];
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

    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cell_id = @"cell";
    FoodTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cell_id];
    if (!cell) {
        cell = [[FoodTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cell_id];
    }
    
  cell.FoodName.text =@"afdjhkj";
    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

@end
