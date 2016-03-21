//
//  FoodDetailTableViewController.m
//  乐旅
//
//  Created by wumeng  on 16/3/17.
//  Copyright © 2016年 姜鸥人. All rights reserved.
//

#import "FoodDetailTableViewController.h"
#import "FoodDetailTableViewCell.h"
#import "CarportTableViewController.h"
#import "FoodModel.h"
#import "FoodRequest.h"
@interface FoodDetailTableViewController ()<FootRequestDalegate>
@property(nonatomic,strong)NSArray *arr1;
@end

@implementation FoodDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    FoodRequest *request = [FoodRequest shareFoodRequest];
    request.delegate =self;
    self.tableView.backgroundColor= [UIColor whiteColor];
    
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithTitle:@"附近车库" style:UIBarButtonItemStylePlain target:self action:@selector(rightAction:)];
    self.navigationItem.rightBarButtonItem = right;
    
    
    
    
    //按定位搜索
//        self.arr1 = [request requestFoodWithLng:@"121.538123" lat:@"31.677132" page:@"1"];
//    
//        // 按城市搜索
//    self.arr1 = [request foodRequestWithCity:@"北京" page:@"1"];
}

//主线程刷新数据
- (void)reloadViewWithData{
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        [weakSelf.tableView reloadData];
    });
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

    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cell_id = @"cell_id";
    FoodDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell_id"];
    if (!cell) {
         cell = [[FoodDetailTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cell_id];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    FoodModel *mod = [[FoodModel alloc]init];
    mod = self.arr1[indexPath.row];
    cell.nameLab.text =self.nameLab;
    cell.startLab.text = self.startLab;
    cell.priceLab.text = self.priceLab;
    cell.phoneLab.text= self.phoneLab;
    cell.diseLabel.text =self.diseLabel;
   
    //    cell.allRemarks.text = self.allRemarks;
    //    cell.goodRemarks.text = self.goodRemarks;
    //    cell.veryGoodMark.text = self.veryGoodMark;
    //    cell.badRemark.text = self.badRemark;
    //    cell.veryBad.text =self.veryBad;
    //    cell.service.text = self.service;
    //    cell.commonRemark.text=self.commonRemark;
    [self.addressButton setTitle:self.address forState:UIControlStateNormal];
    

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 700;
}


@end
