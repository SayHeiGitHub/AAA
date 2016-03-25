//
//  SearchViewController.m
//  乐旅
//
//  Created by wumeng  on 16/3/21.
//  Copyright © 2016年 姜鸥人. All rights reserved.
//

#import "SearchViewController.h"
#define inputW  24
#define imgSearchW  12
@interface SearchViewController ()<UITextFieldDelegate>
@property(nonatomic,strong)UITextField *searchField;
@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    UIBarButtonItem *left = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(leftBtnAction)];
    self.navigationItem.leftBarButtonItem = left;

    //添加输入框
    [self inputTextField];
    
    //监听
    [self notificationCenterAction];
    
    
    //不搜索状态
    [self hiddenSearchAnimation];

}


- (void)leftBtnAction{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 监听键盘的事件
-(void) notificationCenterAction
{
    //监听键盘的事件
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:self.view.window];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:self.view.window];
}

#pragma mark - 屏幕的伸缩
//键盘升起时动画
- (void)keyboardWillShow:(NSNotification*)notif
{
    //动态提起整个屏幕
    [UIView animateWithDuration:4 animations:^{
        
        [self searchAnimation];
        
    } completion:nil];
}

//键盘关闭时动画
- (void)keyboardWillHide:(NSNotification*)notif
{
    
    [UIView animateWithDuration:4 animations:^{
        
        [self hiddenSearchAnimation];
        
    } completion:nil];
}


//************************输入框事件************************
-(void) inputTextField
{
    //****************************搜索框*****************************
    _nameTextField = [[UITextField alloc] initWithFrame:CGRectMake(15, 100, self.view.frame.size.width - 30, 30)];
    _nameTextField.borderStyle = UITextBorderStyleRoundedRect;
    
    //设置输入框内容的字体样式和大小
    _nameTextField.font = [UIFont fontWithName:@"Arial" size:16.0f];
    _nameTextField.textColor  = [UIColor blackColor];
    //    _nameTextField.textAlignment = UITextAlignmentCenter;
    _nameTextField.delegate = self;
    //*******************************************************
    [self.view addSubview:_nameTextField];
    
}


//************************动态事件************************
//显示搜索状态
-(void) searchAnimation
{
    self.inputView = [[UIView alloc] init];
    self.inputView.frame= CGRectMake(0, 0 ,inputW , inputW);
    
    
    
    self.imgSearch = [[UIImageView alloc] init];
    self.imgSearch.image = [UIImage imageNamed:@"搜索"];
    CGRect rx = CGRectMake( 12,(inputW - imgSearchW)/2 , imgSearchW, imgSearchW);
    self.imgSearch.frame = rx;
    
    
    [self.inputView addSubview:self.imgSearch];
    // 把leftVw设置给文本框
    _nameTextField.leftView = self.inputView;
    _nameTextField.leftViewMode = UITextFieldViewModeAlways;
    
    
}
//显示隐藏状态
-(void) hiddenSearchAnimation
{
    self.inputView = [[UIView alloc] init];
    CGFloat textFieldW = (_nameTextField.frame.size.width) / 2 - 30;
    self.inputView.frame= CGRectMake(0, 0 ,textFieldW , inputW);
    
    
    
    
    self.imgSearch = [[UIImageView alloc] init];
    self.imgSearch.image = [UIImage imageNamed:@"搜索"];
    CGRect rx = CGRectMake( textFieldW -12 , (inputW - imgSearchW)/2 , imgSearchW, imgSearchW);
    self.imgSearch.frame = rx;
    
    
    [self.inputView addSubview:self.imgSearch];
    // 把leftVw设置给文本框
    _nameTextField.leftView = self.inputView;
    _nameTextField.leftViewMode = UITextFieldViewModeAlways;
    
    
}

-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
    NSLog(@"*******%@",_nameTextField.text);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
