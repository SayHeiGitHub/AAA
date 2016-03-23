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
#import "FoodDetailTableViewController.h"
@interface FoodTableViewController ()<FootRequestDalegate>
@property(nonatomic,strong)NSMutableArray *arr;
@property(nonatomic,strong)FoodModel *model1;
@end

@implementation FoodTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

     self.navigationItem.title = @"美食";
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    
    // 马上进入刷新状态
    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    
    
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



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return 10;
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
    cell.tagsLab.text = model.tags;
    cell.staLab.text = [NSString stringWithFormat:@"星级:%.1f",model.stars] ;
    cell.avgLab.text =  [NSString stringWithFormat:@"人均:%@",model.avg_price];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
        if ([self.model1.tags isEqualToString:@""]) {
        return 100;
    }else{
        return 150;
    }
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    FoodDetailTableViewController *foodVC = [[FoodDetailTableViewController alloc]init];

    
    FoodModel *model1 = [[FoodModel alloc]init];
    model1 = self.arr[indexPath.row];
    foodVC.nameLab = model1.name;
    foodVC.startLab = [NSString stringWithFormat:@"星级:%.f",model1.stars];
    foodVC.priceLab = [NSString stringWithFormat:@"人均:%@",model1.avg_price];
    foodVC.phoneLab= model1.phone;
    foodVC.diseLabel =model1.recommended_dishes;
    foodVC.address = model1.address;
    foodVC.allRemarks = [NSString stringWithFormat:@"%d",model1.all_remarks];
    foodVC.goodRemarks = [NSString stringWithFormat:@"%d",model1.good_remarks];
    foodVC.veryGoodMark= [NSString stringWithFormat:@"%d",model1.very_good_remarks];
    foodVC.badRemark =[NSString stringWithFormat:@"%d",model1.bad_remarks];
    foodVC.veryBad = [NSString stringWithFormat:@"%d",model1.very_bad_remarks];
    foodVC.commonRemark =[NSString stringWithFormat:@"%d",model1.common_remarks];
    foodVC.service= [NSString stringWithFormat:@"%@",model1.service_rating];
    
    
    
    [self.navigationController pushViewController:foodVC animated:YES];
}


@end
