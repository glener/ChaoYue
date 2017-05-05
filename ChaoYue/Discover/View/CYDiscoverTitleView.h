//
//  CYDiscoverTitleView.h
//  ChaoYue
//
//  Created by again on 2017/5/3.
//  Copyright © 2017年 again. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CYDiscoverTitleView : UIView
//标题数组
@property (strong,nonatomic) NSArray <NSString *>*titles;
/** 点击item回调*/
@property (nonatomic, copy) void(^homeHeaderOptionalViewItemClickHandle)(CYDiscoverTitleView *optionView, NSString *title, NSInteger currentIndex);
/** 偏移量*/
@property (nonatomic, assign) CGPoint contentOffset;
@end
