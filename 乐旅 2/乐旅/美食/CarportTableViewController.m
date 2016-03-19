//
//  CarportTableViewController.m
//  乐旅
//
//  Created by 姜鸥人 on 16/3/18.
//  Copyright © 2016年 姜鸥人. All rights reserved.
//

#import "CarportTableViewController.h"
#import "CarportTableViewCell.h"
#import "DepotModel.h"
#import "FoodRequest.h"
#import <UIImageView+WebCache.h>

@interface CarportTableViewController ()<FootRequestDalegate>
//按定位接收数组
@property(nonatomic,strong)NSMutableArray *arr;
@property(nonatomic,strong)FoodRequest *reqest;

@end

@implementation CarportTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"CarportTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    self.view.backgroundColor  = [UIColor whiteColor];
    
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithTitle:@"刷新" style:UIBarButtonItemStylePlain target:self action:@selector(rightBtnAction:)];
    self.navigationItem.rightBarButtonItem = right;
    self.reqest = [FoodRequest shareFoodRequest];
    self.reqest.delegate = self;
    
    
    //[self makeData];
 

}

-(void)makeData{
    [self.reqest requestDepotWithLng:@"116.337833" lat:@"39.992772" success:^(NSArray *array) {
        [self.arr removeAllObjects];
        [self.arr addObjectsFromArray:array];
        NSLog(@"%@r", array);
    }];}

- (NSMutableArray *)arr {
    if (!_arr) {
        _arr = [NSMutableArray array];
    }
    return _arr;
}
//主线程刷新数据
- (void)reloadViewWithData{
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        [weakSelf.tableView reloadData];
    });
}

// 从新加载车库
-(void)rightBtnAction:(UIBarButtonItem *)sender{
    [self makeData];

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

    NSLog(@"====%@",self.arr);
    return self.arr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 NSArray *Arr = [[NSBundle mainBundle] loadNibNamed:@"CarportTableViewCell" owner:self options:nil];
    
    CarportTableViewCell *cell = [Arr lastObject];
//    CarportTableViewCell *cell =[[CarportTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    DepotModel *model1 = [[DepotModel alloc]init];
    model1 = self.arr[indexPath.row];
    cell.portName.text = model1.CCMC;
    //网址拼接
    NSString *str1 = @"http://images.juheapi.com/park/";
    NSString *str2 =[str1 stringByAppendingString:model1.CCTP];
    NSString *str3 = [str1 stringByAppendingString:model1.KCWZT];
    //图片加载
    [cell.portTP sd_setImageWithURL:[NSURL URLWithString:str2]];
    [cell.portTP.layer setMasksToBounds:YES];
    [cell.portTP.layer setCornerRadius:10];
    [cell.portHOT sd_setImageWithURL:[NSURL URLWithString:str3]] ;
    cell.portBTJG.text = [NSString stringWithFormat:@"%@",model1.BTTCJG];
    cell.portWSJG.text = model1.WSTCJG;
    cell.portZCW.text = model1.ZCW;
    cell.portKCW.text = model1.KCW;
    cell.portAddress.text = model1.CCDZ;
    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 140;
}

@end
