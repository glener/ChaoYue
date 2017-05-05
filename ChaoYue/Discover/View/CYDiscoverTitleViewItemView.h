//
//  CYDiscoverTitleViewItemView.h
//  ChaoYue
//
//  Created by again on 2017/5/3.
//  Copyright © 2017年 again. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CYDiscoverTitleViewItemView : UILabel
/** 填充色，从左开始*/
@property (nonatomic, strong) UIColor *fillColor;
/** 滑动进度*/
@property (nonatomic, assign) CGFloat progress;
@end
