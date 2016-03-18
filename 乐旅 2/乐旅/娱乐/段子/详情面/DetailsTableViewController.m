//
//  DetailsTableViewController.m
//  乐旅
//
//  Created by 姜鸥人 on 16/3/15.
//  Copyright © 2016年 姜鸥人. All rights reserved.
//

#import "DetailsTableViewController.h"
#import "DetailsTableViewCell.h"
@interface DetailsTableViewController ()

@end

@implementation DetailsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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

    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    

    static NSString *cell_id = @"cell";
     DetailsTableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:cell_id];
    if (!cell) {
        cell = [[DetailsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cell_id];
    }
    cell.userContentLabel.text = @"撒发生来哈第三方合计会尽快会尽快会尽快会尽快  会尽快和环境和进口会尽快离开回家后即可很快会尽快汇款市的减肥";
    return cell;

}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 140;
}

@end
