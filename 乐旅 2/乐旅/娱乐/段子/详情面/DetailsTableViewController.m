//
//  DetailsTableViewController.m
//  乐旅
//
//  Created by 姜鸥人 on 16/3/15.
//  Copyright © 2016年 姜鸥人. All rights reserved.
//

#import "DetailsTableViewController.h"
#import "DetailsTableViewCell.h"
#import "DateHandel.h"
#import "BreakTableViewCell.h"
@interface DetailsTableViewController ()
@property(nonatomic,strong)DateHandel *dateHandel;
@end

@implementation DetailsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    NSString *url = [NSString stringWithFormat:@"http://m2.qiushibaike.com/article/%@/comments?article=1&count=50&page=%d&AdID=145724230300957212CC3B",self.model.Id,1];
    //数组存放数据
    [[DateHandel sharedDataHandle]getDataWithStr:url Block:^(NSMutableArray *array) {
        self.array = array;
        
        [self.tableView reloadData];
    }];
//   self.navigationItem.title = [NSString stringWithFormat:@"%@",self.model.user[@"login"]];
    self.navigationItem.title = [NSString stringWithFormat:@"%@",self.model.Id];

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

    return self.array.count + 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        static NSString *cell_id = @"cell";
        BreakTableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:cell_id];
        if (!cell) {
            cell = [[BreakTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cell_id];
        }
       
        cell.userContentLabel.text =self.model.content;
        cell.userName.text = self.model.user[@"login"];
              NSString *a = nil;
        if (self.model.Id!=NULL) {
            a = [NSString stringWithFormat:@"%@",self.model.user[@"id"]];
            a = [a substringToIndex:4];
        }
        NSString *str = [NSString stringWithFormat:@"http://pic.qiushibaike.com/system/avtnew/%@/%@/medium/%@",a,self.model.user[@"id"],self.model.user[@"icon"]];
        [cell.userImageView sd_setImageWithURL:[NSURL URLWithString:str]];

        //通过反回的rect设置lable的高度
        //获取lable的高度(获取frame)
        CGRect labelFrame = cell.userContentLabel.frame;
        //修改获取到得frame;
        labelFrame.size.height = [BreakTableViewCell heightForLableText:cell.userContentLabel.text];
        //再将修改之后的frame赋值给lable
        cell.userContentLabel.frame = labelFrame;
        //改变其他的frame
        [cell changeOtherBtn:cell.userContentLabel.frame];
        [cell setSelected:NO animated:NO];
        [cell setHighlighted:NO animated:NO];
        
         return cell;
    }else{
        static NSString *cell_3 = @"cell_3";
        DetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cell_3];
        if (!cell) {
            cell = [[DetailsTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cell_3];
        }
        BreakModel *model = self.array[indexPath.row-1];

        cell.userContentLabel.text = model.content;
        cell.userName.text = model.user[@"login"];
        NSString *a = nil;
        if (model.Id!=NULL) {
            a = [NSString stringWithFormat:@"%@",model.user[@"id"]];
            a = [a substringToIndex:4];
        }
        NSString *str = [NSString stringWithFormat:@"http://pic.qiushibaike.com/system/avtnew/%@/%@/medium/%@",a,model.user[@"id"],model.user[@"icon"]];
        [cell.userImageView sd_setImageWithURL:[NSURL URLWithString:str]];
        cell.floor.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
        //通过反回的rect设置lable的高度
        //获取lable的高度(获取frame)
        CGRect labelFrame = cell.userContentLabel.frame;
        //修改获取到得frame;
        labelFrame.size.height = [DetailsTableViewCell heightForLableText:cell.userContentLabel.text];
        //再将修改之后的frame赋值给lable
        cell.userContentLabel.frame = labelFrame;
        //改变其他的frame
        [cell changeOtherBtn:cell.userContentLabel.frame];
       return cell;

    }
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
     return [BreakTableViewCell heightForLableText:self.model.content]+110;

    }else{
        BreakModel *model = self.array[indexPath.row-1];
        return [DetailsTableViewCell heightForLableText:model.content]+70;

    }
}

@end
