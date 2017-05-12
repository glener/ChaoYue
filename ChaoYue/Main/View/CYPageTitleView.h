//
//  CYPageTitleView.h
//  ChaoYue
//
//  Created by again on 2017/5/10.
//  Copyright © 2017年 again. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CYPageTitleView;
@protocol CYPageTitleViewDelegate <NSObject>

- (void)pageTitleView:(CYPageTitleView *)pageTitleView selectIndex:(NSInteger)index;

@end

@interface CYPageTitleView : UIView
- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles;
- (void)setTitleWithProgress:(CGFloat)progress sourceIndex:(NSUInteger)sourceIndex targetIndex:(NSInteger)targetIndex;

@property (weak,nonatomic) id<CYPageTitleViewDelegate> delegate;

@end
