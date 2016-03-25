//
//  MyFavoriteViewController.m
//  乐旅
//
//  Created by wumeng  on 16/3/24.
//  Copyright © 2016年 姜鸥人. All rights reserved.
//

#import "MyFavoriteViewController.h"
#import "UIBarButtonItem+Extension.h"
@interface MyFavoriteViewController ()

@end

@implementation MyFavoriteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWith:@"top_navigation_menuicon" target:self action:@selector(leftButtonDidClick:)];
    self.navigationItem.title = @"我的收藏";

}
- (void)leftButtonDidClick:(UIButton *)button
{
    [UIView animateWithDuration:0.5 animations:^{
        CGFloat scale = 0.8;
        CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
        self.navigationController.view.transform = CGAffineTransformMakeScale(0.6, scale);
        self.navigationController.view.transform = CGAffineTransformTranslate(self.navigationController.view.transform, screenW *0.6 - 35, 0);
        //遮盖导航控制器 不让点击
        UIButton *discover = [[UIButton alloc] init];
        discover.frame = self.navigationController.view.bounds;
        [self.navigationController.view addSubview:discover];
        //            button.backgroundColor = [UIColor clearColor];
        [discover addTarget:self action:@selector(discoverDidClick:) forControlEvents:UIControlEventTouchUpInside];
    }];
    
}
/**
 *  点击遮盖导航恢复到全屏
 */
- (void)discoverDidClick:(UIButton *)button
{
    [UIView animateWithDuration:0.5 animations:^{
        self.navigationController.view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [button removeFromSuperview];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return 10;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
