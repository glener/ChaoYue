//
//  CYDiscoverViewController.m
//  ChaoYue
//
//  Created by again on 2017/5/3.
//  Copyright © 2017年 again. All rights reserved.
//

static NSInteger kTitlePageH = 40;

#import "CYDiscoverViewController.h"
#import "CYPageTitleView.h"
#import "CYContentView.h"
#import "CYRecommendViewController.h"
#import "CYSportViewController.h"
#import "CYCycleView.h"

@interface CYDiscoverViewController ()<CYPageTitleViewDelegate, CYContentViewDelegate>

@property (strong,nonatomic) NSMutableArray *childVcs;
@property (weak,nonatomic) CYPageTitleView *pageTitleView;
@property (strong,nonatomic) NSMutableArray *arr;
@property (weak,nonatomic) CYContentView *contentView;

@end

@implementation CYDiscoverViewController

- (CYContentView *)contentView
{
    if (!_contentView) {
        CGFloat contentH = kScreenHeight - kTitlePageH - kNavigationH;
        CYContentView *contentView = [[CYContentView alloc] initWithFrame:CGRectMake(0,  kNavigationH + kTitlePageH, kScreenWidth, contentH) childVcs:self.childVcs  parantsVc:self];
        _contentView = contentView;
        contentView.delegate = self;
        
        [self.view addSubview:contentView];
    }
    return _contentView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupPageTitleView];

    // 设置为不透明
//    self.navigationController.navigationBar.translucent = NO;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
//    NSLog(@"%ld---", self.arr.count);
//    self.pageTitleView.delegate = self;
 
    
    //添加pagetitleView
//    [self.view addSubview:self.contentView];
//    [self.view addSubview:self.pageTitleView];
//    [self.viewl setFrame:CGRectMake(0, 64, 234, 23)];
//    [self.view addSubview:self.viewl];
//    NSLogRect(self.pageTitleView.frame);
    
    [self setupContentView];
    
    //设置导航栏
    [self setupItems];
    
}
- (void)setupPageTitleView
{
    NSArray *arr = @[@"推荐", @"体育"];
    
    CYPageTitleView *page = [[CYPageTitleView alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, kTitlePageH) titles:arr];
    self.pageTitleView = page;
    page.delegate = self;
    [self.view addSubview:page];
}

#pragma mark - pageTitleViewDelegate
- (void)pageTitleView:(CYPageTitleView *)pageTitleView selectIndex:(NSInteger)index
{
    [self.contentView setCurrentIndex:index];
}

#pragma mark - contentViewDelegate
- (void)contentView:(CYContentView *)contenView progress:(CGFloat)progress sourceIndex:(NSInteger)sourceIndex targetIndex:(NSInteger)targetIndex
{
    [self.pageTitleView setTitleWithProgress:progress sourceIndex:sourceIndex targetIndex:targetIndex];
}

- (void)setupContentView
{
    CYRecommendViewController *recommendVc = [[CYRecommendViewController alloc] init];
    CYSportViewController *sportVc = [[CYSportViewController alloc] init];
    [self.childVcs addObject:recommendVc];
    [self.childVcs addObject:sportVc];
    //确定所有子控制器
    for (UIViewController *childVc in self.childVcs) {
//        childVc.view.backgroundColor = kRGBColor(44, arc4random()/255, arc4random()/255);
        [self addChildViewController:childVc];
    }
  
}


- (NSMutableArray *)childVcs
{
    if(_childVcs == nil){
        _childVcs = [NSMutableArray array];
    }
    return _childVcs;
}

- (void)setupItems
{
    self.navigationItem.title = @"发现";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"searchIcon"] style:UIBarButtonItemStylePlain target:self action:@selector(searchItemClick)];
}
- (void)searchItemClick{};

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
