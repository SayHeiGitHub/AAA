//
//  NationFourTableViewController.m
//  全国知名景点
//
//  Created by wumeng  on 16/3/3.
//  Copyright © 2016年 www.lanou3g.com. All rights reserved.
//

#import "NationFourTableViewController.h"
#import "DetailRequest.h"
#import "Model.h"
#import "PublicTableViewCell.h"
@interface NationFourTableViewController ()<DeltailDelegate>

@property(nonatomic,strong)NSArray *mod;
@end

@implementation NationFourTableViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = self.title4;
    DetailRequest *request0 = [DetailRequest shareDetailRequest];

    self.mod = [request0 requestWithDetailURl:self.ied key1:@"sightBean"];
    
    request0.delegate = self;
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(leftItemAction)];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    [self reloadWithView];
}

//实现代理方法
-(void)reloadWithView{

    __weak typeof(self) weakSelf = self;
dispatch_async(dispatch_get_main_queue(), ^{
    [weakSelf.tableView reloadData];
});

}
- (void)leftItemAction{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {


    return self.mod.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cell_id = @"cell_id";
    PublicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell_id"];
    
    if (!cell) {
        cell = [[PublicTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cell_id];
    }
    
    Model *model = [Model new];
    model = self.mod[indexPath.row];
     //去除<>中的字符串
    NSString *str1 = model.desc;
    NSMutableString *str = [NSMutableString stringWithString:str1];
    while (1) {
        
        NSRange range = [str rangeOfString:@"<"];
        NSRange range1 = [str rangeOfString:@">"];
        
        if (range.location != NSNotFound) {
            NSInteger loc = range.location;
            NSInteger len = range1.location - range.location;
            [str deleteCharactersInRange:NSMakeRange(loc, len + 1)];
        }else{
            break;
        }
        
        
    }
    
    cell.detailLab.text  = str;
    //自适应
    CGRect labelFrame = cell.detailLab.frame;
    labelFrame.size.height = [PublicTableViewCell heithForLabelText:cell.detailLab.text];
    cell.detailLab.frame = labelFrame;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //根据数据源文本来设置高度
    Model *text = self.mod[indexPath.row];
    CGFloat h = [PublicTableViewCell heithForLabelText:text.desc];
    return h;
}
@end
