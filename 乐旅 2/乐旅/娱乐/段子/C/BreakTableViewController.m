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
    BreakTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cell_id];
    if (!cell) {
        cell = [[BreakTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cell_id];
    }
    cell.contentLabel.text =@"daffshdfj sdf安静的回复啊啊速度恢复快接啊啊速度发货就卡死法就是地方按时交电话费就阿克苏发数据恢复 氨基酸的回复将阿斯顿发货阿迪就会发觉开始的合法电话服务i啊睡觉的发挥阿斯顿交话费da";
    // Configure the cell...
    
    return cell;
}
// 点击cell 跳转页面
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DetailsTableViewController *DTVC = [[DetailsTableViewController alloc ]init];
    
    [self.navigationController pushViewController:DTVC animated:YES];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
  
    
    
    return  170;
}


@end
