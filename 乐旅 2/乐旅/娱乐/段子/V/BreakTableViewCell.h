//
//  BreakTableViewCell.h
//  乐旅
//
//  Created by 姜鸥人 on 16/3/16.
//  Copyright © 2016年 姜鸥人. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BreakTableViewCell : UITableViewCell

@property(nonatomic,strong)UIImageView *userImage;// 用户头像
@property(nonatomic,strong)UILabel *userLabel;       // 用户名
@property(nonatomic,strong)UILabel *usertype;        // 用户类型
@property(nonatomic,strong)UILabel *contentLabel;   //用户内容

@property(nonatomic,strong)UIButton *smileBtn; // 微笑按钮
@property(nonatomic,strong)UIButton *cryBtn; //哭按钮
@property(nonatomic,strong)UIButton *shareBtn; // 分享按钮
@property(nonatomic,strong)UIButton *commemtBtn; //评论


@end
