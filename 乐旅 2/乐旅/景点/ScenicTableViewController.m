//
//  ScenicTableViewController.m
//  乐旅
//
//  Created by 姜鸥人 on 16/3/14.
//  Copyright © 2016年 姜鸥人. All rights reserved.
//

#import "ScenicTableViewController.h"
#import "SecnicTableViewCell.h"
#import "NationwideTableViewCell.h"
#import "Request.h"
#import "Model.h"
#import "UIImageView+WebCache.h"
#import "NationTwoTableViewController.h"
#import "PublicTableViewCell.h"
@interface ScenicTableViewController ()<NationwideRequestDelegate>
@property(nonatomic,strong)NSArray *arr;

@end

@implementation ScenicTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //导航栏背景颜色设置
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.494 green:0.706 blue:0.651 alpha:1.000];
    Request *request0 = [Request shareNationwideRequest];
    request0.delegate = self;
    self.arr = [request0 requestWithNationwideURl:kNation urrl:@"001001" key1:@"regions"];
    
    self.navigationItem.title = @"全国知名景点";
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"刷新" style:UIBarButtonItemStylePlain target:self action:@selector(rightItemAction)];
    self.navigationItem.rightBarButtonItem=rightItem;
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithTitle:@"别瞎点" style:UIBarButtonItemStylePlain target:self action:@selector(leftItemAction)];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    
    self.view.backgroundColor = [UIColor greenColor];
    
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

- (void)leftItemAction{
    [self.tableView reloadData];
    
}


- (void)rightItemAction{
    [self.tableView reloadData];
}
// 主线程刷新数据源
- (void)reloadViewWithData{
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        [weakSelf.tableView reloadData];
    });
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
    NationwideTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cell_id ];
    if (!cell) {
        cell = [[NationwideTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cell_id];
    }
    //    cell.SecnicLabel.text =@"aadf";
    Model *re = [[Model alloc]init];
    re = self.arr[indexPath.row];
    NSString *str;
    NSString *str1 = re.namec;
    NSString *str2 = @"(共";
    NSString *str3 = re.count;
    NSString *str4 = @"个区域)";
    str = [str1 stringByAppendingString:str2];
    str = [NSString stringWithFormat:@"%@%@%@%@",str1,str2,str3,str4];
    cell.provinceName.text = str;
    NSString *str0;
    NSString *str11 = @"家景点门票";
    NSString *str23 = re.sellSightCount;
    str0 = [NSString stringWithFormat:@"%@%@",str23,str11];
    cell.sightNum.text =str0;
    
    
    
    
    [cell.imageView1 sd_setImageWithURL:[NSURL URLWithString:re.pic]];
    [cell.imageView1.layer setMasksToBounds:YES];
    [cell.imageView1.layer setCornerRadius:10];
    
    
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
// 点击进入详情界面
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NationTwoTableViewController *nation = [[NationTwoTableViewController alloc]init];
    
    
    Model *model = [Model new];
    model = self.arr[indexPath.row];
    nation.iqd = model.iid;
    nation.title1 = model.namec;
    [self.navigationController pushViewController:nation animated:YES];
}

@end
