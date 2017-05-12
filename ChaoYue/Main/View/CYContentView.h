//
//  CYContentView.h
//  ChaoYue
//
//  Created by again on 2017/5/11.
//  Copyright © 2017年 again. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CYContentView;
@protocol CYContentViewDelegate <NSObject>

- (void)contentView:(CYContentView *)contenView progress:(CGFloat)progress sourceIndex:(NSInteger)sourceIndex targetIndex:(NSInteger)targetIndex;

@end

@interface CYContentView : UIView

- (instancetype)initWithFrame:(CGRect)frame childVcs:(NSMutableArray *)childVcs parantsVc:(UIViewController *)parantsVc;

- (void)setCurrentIndex:(NSInteger)index;
@property (weak,nonatomic) id<CYContentViewDelegate> delegate;

@end
