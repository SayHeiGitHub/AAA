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
#import "FoodRequest.h"
#import "FoodModel.h"
@interface FoodTableViewController ()<FootRequestDalegate>
@property(nonatomic,strong)NSMutableArray *arr;
@end

@implementation FoodTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

     self.navigationItem.title = @"美食";
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    
    // 马上进入刷新状态
    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithTitle:@"车库" style:UIBarButtonItemStylePlain target:self action:@selector(rightAction:)];
    self.navigationItem.rightBarButtonItem = right;
    FoodRequest *request = [FoodRequest shareFoodRequest];
    request.delegate = self;
    
    
     [request foodRequestWithCity:@"北京" page:@"2" success:^(NSArray *array) {
         [self.arr removeAllObjects];
         [self.arr addObjectsFromArray:array];
    }];
}
// 代理方法 回到主 线程 刷新
- (void)reloadViewWithData{
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        [weakSelf.tableView reloadData];
    });
}

-(NSMutableArray *)arr{
    if (!_arr) {
        _arr  = [NSMutableArray array];
    }
    return  _arr;
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

    return self.arr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cell_id = @"cell";
    FoodTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cell_id];
    if (!cell) {
        cell = [[FoodTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cell_id];
    }
    FoodModel *model = [[FoodModel alloc]init];
    model = self.arr[indexPath.row];
    cell.FoodName.text = model.name;
    [cell.FoodImage sd_setImageWithURL:[NSURL URLWithString:model.photos]];
    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

@end
