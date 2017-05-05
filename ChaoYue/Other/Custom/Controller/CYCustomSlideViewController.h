//
//  CYCustomSlideViewController.h
//  ChaoYue
//
//  Created by again on 2017/5/3.
//  Copyright © 2017年 again. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CYCustomSlideViewController;
@protocol CYCustomSlideViewControllerDelegate <NSObject>
@optional
/** 滚动偏移量*/
- (void)customSlideViewController:(CYCustomSlideViewController *)slideViewController slideOffset:(CGPoint)slideOffset;
- (void)customSlideViewController:(CYCustomSlideViewController *)slideViewController slideIndex:(NSInteger)slideIndex;
@end

@protocol CYCustomSlideViewControllerDataSource <NSObject>
/** 子控制器*/
- (UIViewController *)slideViewController:(CYCustomSlideViewController *)slideViewController viewControllerAtIndex:(NSInteger)index;
/** 子控制器数量*/
- (NSInteger)numberOfChildViewControllersInSlideViewController:(CYCustomSlideViewController *)slideViewController;
@end

@interface CYCustomSlideViewController : UIViewController

@property (nonatomic, weak) id <CYCustomSlideViewControllerDelegate> delegate;
@property (nonatomic, weak) id <CYCustomSlideViewControllerDataSource> dataSource;
@property (nonatomic, assign) NSInteger seletedIndex;
- (void)reloadData;
@end
