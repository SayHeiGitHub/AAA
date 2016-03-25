//
//  FoodDetailTableViewCell.m
//  乐旅
//
//  Created by wumeng  on 16/3/17.
//  Copyright © 2016年 姜鸥人. All rights reserved.
//

#import "FoodDetailTableViewCell.h"
#import "UIView+SDAutoLayout.h"
#import "UITableView+SDAutoTableViewCellHeight.h"
#import "HXEasyCustomShareView.h"
@implementation FoodDetailTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self allView];
    }
    return self;
}

- (void)allView{
    //背景图片
    self.image1 = [[UIImageView alloc]init];
    self.image1.image = [UIImage imageNamed:@"1.jpg"];
    [self.contentView addSubview:self.image1];
    self.image1.backgroundColor = [UIColor colorWithRed:25.0 green:147.0 blue:250.0 alpha:1.0];
    self.image1.sd_layout.leftEqualToView(self.contentView).topSpaceToView(self.contentView,1).rightEqualToView(self.contentView).heightIs(200);
    //店名
    self.nameLab = [[UILabel alloc]init];
    self.nameLab.font = [UIFont systemFontOfSize:18];
    self.nameLab.numberOfLines = 0;
    [self.image1 addSubview:self.nameLab];
    //    self.nameLab.backgroundColor = [UIColor greenColor];
    self.nameLab.sd_layout.leftSpaceToView(self.image1,10).topSpaceToView(self.image1,10).widthIs(360).heightIs(60);
    //分享
    self.button = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.button setTitle:@"分享" forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.contentView addSubview:self.button];
    
    self.button.sd_layout.leftSpaceToView(self.phoneLab,300).topSpaceToView(self.addressButton,240).widthIs(50).heightIs(30);
    
    
    //星级
    self.startLab = [[UILabel alloc]init];
    [self.image1 addSubview:self.startLab];
    self.startLab.sd_layout.leftEqualToView(self.nameLab).topSpaceToView
    (self.nameLab,30).widthIs(130).heightIs(30);
    //人均消费
    self.priceLab = [[UILabel alloc]init];
    [self.image1 addSubview:self.priceLab];
    self.priceLab.sd_layout.leftSpaceToView(self.startLab,10).topEqualToView(self.startLab).widthIs(100).heightIs(30);
    //地址图片
    self.imageMap = [[UIImageView alloc]init];
    [self.contentView addSubview:self.imageMap];
    //电话图标
    self.imagePhone = [[UIImageView alloc]init];
    self.imagePhone.image = [UIImage imageNamed:@"default_groupbuying_telephone_button_normal"];
    [self.contentView addSubview:self.imagePhone];
    self.imagePhone.sd_layout.leftSpaceToView(self.contentView,10).topSpaceToView(self.image1,35).widthIs(40).heightIs(40);
    
    //电话
    self.phoneLab = [[UILabel alloc]init];
    [self.contentView addSubview:self.phoneLab];
    self.phoneLab.sd_layout.leftSpaceToView(self.imagePhone,10).topSpaceToView(self.addressButton,240).rightEqualToView(self.contentView).heightIs(30);
    self.addressButton = [UIButton buttonWithType:UIButtonTypeSystem];
    
    NSString *str = [NSString stringWithFormat:@"%@",self.address];
    [self.addressButton setTitle:str forState:UIControlStateNormal];
    
    [self.addressButton addTarget:self action:@selector(addressButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.addressButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    //设置button的内容左对齐
    self.addressButton.titleLabel.font = [UIFont systemFontOfSize:15];
    //设置间距
    self.addressButton.imageEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    self.addressButton.titleEdgeInsets = UIEdgeInsetsMake(0, 30, 0, 0);
    self.addressButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self.contentView addSubview:self.addressButton];
    self.addressButton.sd_layout.leftEqualToView(self.contentView).topSpaceToView(self.image1,100).rightEqualToView(self.contentView).heightIs(50);
    
    
    
    //总评论人数
    self.allRemarks = [[UILabel alloc]init];
    [self.contentView addSubview:self.allRemarks];
    //好评人数
    self.goodRemarks = [[UILabel alloc]init];
    [self.contentView addSubview: self.goodRemarks];
    //非常好评人数
    self.veryGoodMark =[[UILabel alloc]init];
    [self.contentView addSubview:self.veryGoodMark];
    //服务评分
    self.service = [[UILabel alloc]init];
    [self.contentView addSubview:self.service];
    //差评人数
    self.badRemark = [[UILabel alloc]init];
    [self.contentView addSubview:self.badRemark];
    //非常差评人数
    self.veryBad = [[UILabel alloc]init];
    [self.contentView addSubview:self.veryBad];
    //一般评论人数
    self.commonRemark = [[UILabel alloc]init];
    [self.contentView addSubview:self.commonRemark];
    //本店特色菜
    self.diseLab = [[UILabel alloc]init];
    self.diseLab.text=@"本店特色菜:";
    self.diseLab.font = [UIFont systemFontOfSize:20];
    [self.contentView addSubview:self.diseLab];
    self.diseLab.sd_layout.leftSpaceToView(self.contentView,15).topSpaceToView(self.image1,180).rightEqualToView(self.contentView).heightIs(30);
    //推荐菜详细介绍
    self.diseLabel = [[UILabel alloc]init];
    self.diseLabel.font= [UIFont systemFontOfSize:16];
    self.diseLabel.numberOfLines=0;
    
    [self.contentView addSubview:self.diseLabel];
    self.diseLabel.sd_layout.leftEqualToView(self.diseLab).topSpaceToView(self.diseLab,20).rightEqualToView(self.contentView).autoHeightRatio(0);
    
    }

-(void)addressButtonAction:(UIButton *)sender{
    NSLog(@"点击了");
}

- (void)buttonAction:(UIButton *)sender {
    NSLog(@"带你飞");
    [self addWeixinShareView];
}

/**
 *  仿微信分享界面
 */
- (void)addWeixinShareView {
    NSArray *shareAry = @[@{@"image":@"Action_Share",
                            @"title":@"发送给朋友"},
                          @{@"image":@"Action_Moments",
                            @"title":@"朋友圈"},
                          @{@"image":@"Action_MyFavAdd",
                            @"title":@"收藏"},
                          @{@"image":@"AS_safari",
                            @"title":@"Safari打开"},
                          @{@"image":@"AS_Email",
                            @"title":@"邮件"},
                          @{@"image":@"AS_QQ",
                            @"title":@"QQ"},
                          @{@"image":@"Action_Verified",
                            @"title":@"查看公众号"},
                          @{@"image":@"Action_Copy",
                            @"title":@"复制链接"},
                          @{@"image":@"Action_Font",
                            @"title":@"调整字体"},
                          @{@"image":@"Action_Refresh",
                            @"title":@"刷新"},
                          @{@"image":@"Action_Expose",
                            @"title":@"举报"}];
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGMMainScreenWidth, 30)];
    headerView.backgroundColor = [UIColor clearColor];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 9, headerView.frame.size.width, 11)];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor colorWithRed:99/255.0 green:98/255.0 blue:98/255.0 alpha:1.0];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:11];
    label.text = @"网页由 mp.weixin.qq.com 提供";
    [headerView addSubview:label];
    
    HXEasyCustomShareView *shareView = [[HXEasyCustomShareView alloc] initWithFrame:CGRectMake(0, 0, CGMMainScreenWidth, CGMMainScreenHeight)];
    shareView.backView.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.9];
    shareView.headerView = headerView;
    float height = [shareView getBoderViewHeight:shareAry firstCount:6];
    shareView.boderView.frame = CGRectMake(0, 0, shareView.frame.size.width, height);
    [shareView setShareAry:shareAry delegate:self];
    shareView.middleLineLabel.frame = CGRectMake(10, shareView.middleLineLabel.frame.origin.y, shareView.frame.size.width-20, shareView.middleLineLabel.frame.size.height);
    shareView.showsHorizontalScrollIndicator = NO;
    [self.contentView addSubview:shareView];
}



- (void)easyCustomShareViewButtonAction:(HXEasyCustomShareView *)shareView title:(NSString *)title {
    NSLog(@"当前点击:%@",title);
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
