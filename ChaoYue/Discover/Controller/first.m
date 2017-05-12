////
////  CYDiscoverViewController.m
////  ChaoYue
////
////  Created by again on 2017/5/3.
////  Copyright © 2017年 again. All rights reserved.
////
//
//static NSInteger kTitlePageH = 40;
//
//#import "CYDiscoverViewController.h"
//#import "CYPageTitleView.h"
//#import "CYContentView.h"
////#import "CYDiscoverTitleView.h"
//#import "CYRecommendViewController.h"
////#import "CYEvaluationViewController.h"
////#import "CYLoseWeightViewController.h"
//#import "CYSportViewController.h"
////#import "CYCustomSlideViewController.h"
//
//@interface CYDiscoverViewController ()
////@property (weak,nonatomic) CYDiscoverTitleView *optionalView;
////
////@property (nonatomic, weak) CYCustomSlideViewController *slideViewController;
//@property (strong,nonatomic) NSMutableArray *titles;
//@property (nonatomic, strong) NSMutableArray *dataArray;
//@property (nonatomic, strong) NSMutableArray *controllers;
//@property (nonatomic, strong) NSMutableArray *urls;
//@property (nonatomic, assign) NSInteger currentIndex;
//@property (nonatomic, assign) CGFloat barLength;
//
//@property (strong,nonatomic) NSMutableArray *childVcs;
//@property (weak,nonatomic) CYPageTitleView *pageTitleView;
//@property (strong,nonatomic) NSArray *arr;
//
//@end
//
//@implementation CYDiscoverViewController
//
//- (NSArray *)arr
//{
//    if (!_arr) {
//        _arr = [NSArray array];
//    }
//    return _arr;
//}
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    NSArray *arr = @[@"推荐", @"体育", @"赛事"];
//    self.arr = arr;
//    //    [self.view addSubview:self.pageTitleView];
//    
//    //不需要UIscrollView的内边距
//    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
//        self.edgesForExtendedLayout = UIRectEdgeNone;
//        self.navigationController.navigationBar.translucent = NO;
//        self.tabBarController.tabBar.translucent = NO;
//        self.automaticallyAdjustsScrollViewInsets = NO;
//    }
//    //    self.automaticallyAdjustsScrollViewInsets = NO;
//    [self setupPageTitleView];
//    [self setupContentView];
//    NSLogRect(self.pageTitleView.frame);
//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, 20)];
//    NSLogPoint(self.view.origin);
//    view.backgroundColor = kRGBColor(55, 243, 55);
//    [self.view addSubview:view];
//    NSLogRect(self.view.frame);
//    self.pageTitleView.backgroundColor = kNormalColor;
//    
//    //添加所有子控制器
//    //    [self setupChildViewController];
//    
//    //设置导航栏
//    [self setupItems];
//    
//    //设置子视图
//    [self setupViews];
//    
//    //初始化scrollView
//    //    [self setupScrollView];
//    
//    //设置标题
//    //    [self setupTitleBtn];
//}
//
//- (void)setupContentView
//{
//    CGFloat contentH = kScreenHeight - 64 - kTitlePageH;
//    
//    CYContentView *contentView = [[CYContentView alloc] initWithFrame:CGRectMake(0, kTitlePageH, kScreenWidth, contentH) childVcs:self.childVcs  parantsVc:self];
//    
//    [self.view addSubview:contentView];
//    
//    CYRecommendViewController *recommendVc = [[CYRecommendViewController alloc] init];
//    CYSportViewController *sportVc = [[CYSportViewController alloc] init];
//    [self.childVcs addObject:recommendVc];
//    [self.childVcs addObject:sportVc];
//    CYSportViewController *sportVc1 = [[CYSportViewController alloc] init];
//    [self.childVcs addObject:sportVc1];
//    //    for (NSString *str in self.arr) {
//    //        UIViewController *childVc = [[UIViewController alloc] init];
//    //        childVc.title = str;
//    //        [self.childVcs addObject:childVc];
//    //    }
//    
//    
//    for (UIViewController *childVc in self.childVcs) {
//        childVc.view.backgroundColor = kRGBColor(44, arc4random()/255, arc4random()/255);
//        [self addChildViewController:childVc];
//    }
//}
//
//- (CYPageTitleView *)pageTitleView
//{
//    if (_pageTitleView == nil) {
//        CYPageTitleView *page = [[CYPageTitleView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kTitlePageH) titles:self.arr];
//        _pageTitleView = page;
//        [self.view addSubview:_pageTitleView];
//        
//    }
//    return _pageTitleView;
//}
//
//- (void)setupPageTitleView
//{
//    //    self.pageTitleView = [[CYPageTitleView alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, kTitlePageH) titles:self.arr];
//    //        self.pageTitleView = pagetitleView;
//    //        [self.view addSubview:self.pageTitleView];
//    //    NSLogRect(self.view.frame);
//}
//
//- (NSMutableArray *)childVcs
//{
//    if(_childVcs == nil){
//        _childVcs = [NSMutableArray array];
//    }
//    return _childVcs;
//}
//
//- (void)setupViews
//{
//    
//}
//
//- (void)setupItems
//{
//    self.navigationItem.title = @"发现";
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"searchIcon"] style:UIBarButtonItemStylePlain target:self action:@selector(searchItemClick)];
//}
//
//// 点击搜索按钮
//- (void)searchItemClick
//{
//    
//}
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
////
////
////
//@end
