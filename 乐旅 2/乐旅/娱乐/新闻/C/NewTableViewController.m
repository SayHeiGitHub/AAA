//
//  NewTableViewController.m
//  乐旅
//
//  Created by 姜鸥人 on 16/3/14.
//  Copyright © 2016年 姜鸥人. All rights reserved.
//

#import "NewTableViewController.h"
#import "NewTableViewCell.h"
@interface NewTableViewController ()<UIScrollViewDelegate>
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UIPageControl *page;
@end

@implementation NewTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self aotuLayoutView];

    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    
    // 马上进入刷新状态
    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
}

-(void) aotuLayoutView{
    UIView *titleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KWindowWidth, 100)];
    titleView.backgroundColor =[ UIColor greenColor];
    UIScrollView *scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, KWindowWidth, 100)];
    scroll.contentSize = CGSizeMake(KWindowWidth * 4, scroll.frame.size.height);
    scroll.pagingEnabled = YES;
    self.scrollView =scroll;
    scroll.delegate =self;
    
    
    scroll.backgroundColor = [UIColor yellowColor];
    [titleView addSubview:scroll];
    UILabel * a = [[UILabel alloc]initWithFrame:CGRectMake(600, 30, 30, 30)];
    a.backgroundColor =[ UIColor greenColor];
    a.text= @"adfa";
    [scroll addSubview:a];
    self.tableView.tableHeaderView = titleView;
    UIPageControl *page = [[UIPageControl alloc]init];
    self.page = page;
    [titleView addSubview:page];
    page.sd_layout.rightSpaceToView(titleView,10).bottomSpaceToView(titleView,10).leftSpaceToView(scroll,300).heightIs(20).widthIs(80);
    //    page.frame =CGRectMake(50, 50, 100, 30);
    page.numberOfPages = 4;
    [page addTarget:self action:@selector(pageAction:) forControlEvents:UIControlEventValueChanged];
    page.currentPageIndicatorTintColor = [UIColor greenColor];
    page.pageIndicatorTintColor = [UIColor orangeColor];
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

    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

  static NSString *cell_id= @"cell";
    NewTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cell_id ];
    if (!cell) {
        cell = [[NewTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cell_id];
    }
cell.NewContent.text = @"adfsdfsfa";

    return cell;
}

// 点击Page改变偏移量
-(void)pageAction:(UIPageControl *)sender{
    self.scrollView.contentOffset =CGPointMake(KWindowWidth * sender.currentPage, 0);
}
// 滑动视图page改变
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    self.page.currentPage = scrollView.contentOffset.x / KWindowWidth;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}

@end
