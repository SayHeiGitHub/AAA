//
//  UIBarButtonItem+Extension.h
//  网易新闻
//
//  Created by apple on 16/3/17.
//  Copyright © 2016年 winter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

+(UIBarButtonItem *)barButtonItemWith:(NSString *)imageName target:(id)target action:(SEL)action;
@end
