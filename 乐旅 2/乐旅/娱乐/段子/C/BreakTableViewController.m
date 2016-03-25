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
#import "DateHandel.h"
#import "BreakModel.h"
#import "UIImageView+WebCache.h"
static  NSInteger a = 2;
@interface BreakTableViewController ()
@property(nonatomic,strong)NSMutableArray *arr;
@property(nonatomic,strong)NSMutableArray *array1;
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
-(NSMutableArray *)arr{
    if (!_arr) {
        _arr = [NSMutableArray array];
    }
    return _arr;
}

- (void)loadNewData{
    [self getNewDate];
    [self.tableView reloadData];
    [self.tableView.mj_header endRefreshing];
}

-(void)loadMoreData{
    NSString *url = [NSString stringWithFormat:@"http://m2.qiushibaike.com/article/list/text?count=30&page=%ld&AdID=145682018775107212CC3B",a];
    a=a+1;
    [[DateHandel sharedDataHandle]getDataWithStr:url Block:^(NSMutableArray *array) {
    
        [self.arr addObjectsFromArray:array];
        [self.tableView reloadData];
    }];

    [self.tableView reloadData];
    [self.tableView.mj_footer endRefreshing];
}


-(void)getNewDate{
    NSString *url = [NSString stringWithFormat:@"http://m2.qiushibaike.com/article/list/latest?count=30&page=%ld&AdID=145682018775107212CC3B",a];
    a=a+1;
    [[DateHandel sharedDataHandle]getDataWithStr:url Block:^(NSMutableArray *array) {
              self.arr = array;
    
        [self.tableView reloadData];
    }];

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
    
    return self.arr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BreakModel *model = self.arr[indexPath.row];
    static NSString *cell_i = @"cell_i";
    BreakTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cell_i];
    if (!cell) {
        cell = [[BreakTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cell_i];
    }
//    [cell.smileBtn addTarget:self action:@selector(smileBtnAction:) forControlEvents:UIControlEventTouchUpInside];
//    [cell.cryBtn addTarget:self action:@selector(cryBtnAction:) forControlEvents:UIControlEventTouchUpInside];
//    [cell.commentBtn addTarget:self action:@selector(commentBtnAction:) forControlEvents:UIControlEventTouchUpInside];
//    [cell.shareBtn addTarget:self action:@selector(shareBtnAction:) forControlEvents:UIControlEventTouchUpInside];
                    cell.userContentLabel.text =model.content;
                    cell.userName.text = model.user[@"login"];
                    NSString *a = nil;
                    if (model.Id!=NULL) {
                        a = [NSString stringWithFormat:@"%@",model.user[@"id"]];
                        a = [a substringToIndex:4];
                    }
                    NSString *str = [NSString stringWithFormat:@"http://pic.qiushibaike.com/system/avtnew/%@/%@/medium/%@",a,model.user[@"id"],model.user[@"icon"]];
                    [cell.userImageView sd_setImageWithURL:[NSURL URLWithString:str]];
                    [cell.shareBtn addTarget:self action:@selector(shareBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    //通过反回的rect设置lable的高度
    //获取lable的高度(获取frame)
    CGRect labelFrame = cell.userContentLabel.frame;
    //修改获取到得frame;
    labelFrame.size.height = [BreakTableViewCell heightForLableText:cell.userContentLabel.text];
    //再将修改之后的frame赋值给lable
    cell.userContentLabel.frame = labelFrame;
    //改变其他的frame
    [cell changeOtherBtn:cell.userContentLabel.frame];
    
    return cell;
}
// 分享按钮
-(void)shareBtnAction:(UIButton *)sender{
    NSLog(@"分享");
}
// 点击cell 跳转页面
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
      [tableView deselectRowAtIndexPath:indexPath animated:NO];//取消选中
     BreakModel *model = self.arr[indexPath.row];
    DetailsTableViewController *DTVC = [[DetailsTableViewController alloc ]init];
//    DTVC.model = [[BreakModel alloc] init];
    DTVC.model = model;
    DTVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:DTVC animated:YES];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    BreakModel *model = self.arr[indexPath.row];
    return [BreakTableViewCell heightForLableText:model.content]+110;

}
@end
