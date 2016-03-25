//
//  NationThreeTableViewController.m
//  全国知名景点
//
//  Created by wumeng  on 16/3/3.
//  Copyright © 2016年 www.lanou3g.com. All rights reserved.
//

#import "NationThreeTableViewController.h"
#import "NationwideTableViewCell.h"
#import "NationFourTableViewController.h"
#import "Request.h"
#import "Model.h"
#import "UIImageView+WebCache.h"
@interface NationThreeTableViewController ()<NationwideRequestDelegate>
@property(nonatomic,strong)NSArray *arr;
@end

@implementation NationThreeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Request *request0 = [Request shareNationwideRequest];
    request0.delegate = self;
    self.arr = [request0 requestWithNationwideURl:kNationThree urrl:self.iwd key1:@"sights"];
    
    self.navigationItem.title = self.title3;
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"刷新" style:UIBarButtonItemStylePlain target:self action:@selector(rightItemAction)];
    self.navigationItem.rightBarButtonItem=rightItem;
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(leftItemAction)];
    self.navigationItem.leftBarButtonItem = leftItem;
    

    }
- (void)rightItemAction{
    [self.tableView reloadData];
}

- (void)leftItemAction{
    [self.navigationController popViewControllerAnimated:YES];
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
    static NSString *cell_id = @"cell_id";
    NationwideTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell_id"];
    
    if (!cell) {
        cell = [[NationwideTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cell_id];
    }
   
    Model *reo = [[Model alloc]init];
    reo = self.arr[indexPath.row];
    
    
    cell.provinceName.text = reo.namec;
    [cell.imageView1 sd_setImageWithURL:[NSURL URLWithString:reo.pic]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NationFourTableViewController *nation4 = [[NationFourTableViewController alloc]init];
    Model *mo = [[Model alloc]init];
    mo = self.arr[indexPath.row];
    nation4.ied = mo.iid;
    nation4.title4 = mo.namec;
    [self.navigationController pushViewController:nation4 animated:YES];
    
}


@end
