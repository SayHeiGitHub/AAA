//
//  PublicTableViewCell.m
//  全国知名景点
//
//  Created by wumeng  on 16/3/4.
//  Copyright © 2016年 www.lanou3g.com. All rights reserved.
//

#import "PublicTableViewCell.h"

@implementation PublicTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self allView];
    }
    return self;
}

- (void)allView{
    self.detailLab = [[UILabel alloc]initWithFrame:CGRectMake(20, 10, 340, 700)];
//    self.detailLab.font = [UIFont systemFontOfSize:20];
    self.detailLab.numberOfLines = 0;
    self.detailLab.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:self.detailLab];
}

//自适应高度
+ (CGFloat)heithForLabelText:(NSString *)text{
    CGSize size = CGSizeMake(340, 2000);
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:17]};
    CGRect rect = [text boundingRectWithSize:size options:(NSStringDrawingUsesLineFragmentOrigin) attributes:dic context:nil];

    return rect.size.height;
}


@end
