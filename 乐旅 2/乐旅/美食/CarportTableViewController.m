//
//  CarportTableViewController.m
//  乐旅
//
//  Created by 姜鸥人 on 16/3/18.
//  Copyright © 2016年 姜鸥人. All rights reserved.
//

#import "CarportTableViewController.h"
#import "CarportTableViewCell.h"
@interface CarportTableViewController ()

@end

@implementation CarportTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor  = [UIColor whiteColor];
    
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithTitle:@"刷新" style:UIBarButtonItemStylePlain target:self action:@selector(rightAction:)];
    self.navigationItem.rightBarButtonItem = right;
    
//    [self.tableView registerClass:[CarportTableViewCell class] forCellReuseIdentifier:@"cell"];
    
    
}
// 从新加载车库
-(void)rightAction:(UIBarButtonItem *)sender{
    NSLog(@"刷新车库");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 NSArray *Arr = [[NSBundle mainBundle] loadNibNamed:@"CarportTableViewCell" owner:self options:nil];
    CarportTableViewCell *cell = [Arr lastObject];
    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 140;
}

@end
