//
//  SearchViewController.h
//  乐旅
//
//  Created by wumeng  on 16/3/21.
//  Copyright © 2016年 姜鸥人. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchViewController : UIViewController
@property (nonatomic ,strong ) UIView *inputView; //左边输入视图
@property (nonatomic , strong) UITextField *nameTextField;//搜索框
@property (nonatomic , strong) UIImageView *imgSearch; //搜索图片
@end
