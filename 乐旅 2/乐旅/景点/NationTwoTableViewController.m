//
//  NationTwoTableViewController.m
//  全国知名景点
//
//  Created by wumeng  on 16/3/3.
//  Copyright © 2016年 www.lanou3g.com. All rights reserved.
//

#import "NationTwoTableViewController.h"
#import "NationwideTableViewCell.h"
#import "NationThreeTableViewController.h"
#import "Request.h"
#import "Model.h"
#import "UIImageView+WebCache.h"
@interface NationTwoTableViewController ()<NationwideRequestDelegate>

@property (nonatomic,strong)NSArray *arrray;
@end

@implementation NationTwoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.navigationItem.title = self.title1;
    
    Request *requst = [Request new];
    self.arrray = [requst requestWithNationwideURl:kNationTwo urrl:self.iqd key1:@"regions"];
    requst.delegate = self;
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"刷新" style:UIBarButtonItemStylePlain target:self action:@selector(rightItemAction)];
    self.navigationItem.rightBarButtonItem=rightItem;
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(leftItemAction)];
//    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"btn_nav_back@2x.png"] style:UIBarButtonItemStylePlain target:self action:@selector(leftItemAction)];
    self.navigationItem.leftBarButtonItem = leftItem;
    
   }

- (void)rightItemAction{
    [self.tableView reloadData];
}

- (void)leftItemAction{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

    return self.arrray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cell_id = @"cell_id";
    NationwideTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell_id"];
    
    if (!cell) {
        cell = [[NationwideTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cell_id];
    }
   
    Model *reo = [[Model alloc]init];
    reo = self.arrray[indexPath.row];
//    cell.provinceName.text = reo.namec;
    
    NSString *str;
    NSString *str1 = reo.namec;
    NSString *str2 = @"(共";
    NSString *str3 = reo.sightCount;
  
    NSString *str4 = @"个区域)";
    str = [str1 stringByAppendingString:str2];
    str = [NSString stringWithFormat:@"%@%@%@%@",str1,str2,str3,str4];
    cell.provinceName.text = str;
    NSString *str0;
    NSString *str11 = @"家景点门票";
    NSString *str23 = reo.sellSightCount;
    str0 = [NSString stringWithFormat:@"%@%@",str23,str11];
    cell.sightNum.text =str0;
    
    
    [cell.imageView1 sd_setImageWithURL:[NSURL URLWithString:reo.pic]];
    return cell;
}
// 行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
//点击进入下一页

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NationThreeTableViewController *nation3= [[NationThreeTableViewController alloc]init];
    Model *mode = [[Model alloc]init];
    mode = self.arrray[indexPath.row];
    nation3.iwd = mode.iid;
    nation3.title3 = mode.namec;
    
    [self.navigationController pushViewController:nation3 animated:YES];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
