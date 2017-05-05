//
//  CYDiscoverViewController.m
//  ChaoYue
//
//  Created by again on 2017/5/3.
//  Copyright © 2017年 again. All rights reserved.
//

#import "CYDiscoverViewController.h"
#import "CYDiscoverTitleView.h"
#import "CYRecommendViewController.h"
#import "CYEvaluationViewController.h"
#import "CYLoseWeightViewController.h"
#import "CYSportViewController.h"
#import "CYCustomSlideViewController.h"

@interface CYDiscoverViewController () <CYCustomSlideViewControllerDelegate, CYCustomSlideViewControllerDataSource>
@property (weak,nonatomic) CYDiscoverTitleView *optionalView;

@property (nonatomic, weak) CYCustomSlideViewController *slideViewController;
@property (strong,nonatomic) NSMutableArray *titles;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) NSMutableArray *controllers;
@property (nonatomic, strong) NSMutableArray *urls;
@property (nonatomic, assign) NSInteger currentIndex;
@property (nonatomic, assign) CGFloat barLength;

//
//@property (strong,nonatomic) NSMutableArray *Vcarr;
//
//@property (weak, nonatomic) UIScrollView *titleScrollView;
//@property (weak, nonatomic) UIScrollView *contentScrollView;
//@property (strong,nonatomic) NSMutableArray *titleBtns;
//@property (weak,nonatomic) UIButton *selButton;


@end

@implementation CYDiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //添加所有子控制器
//    [self setupChildViewController];
    
    //设置导航栏
    [self setupItems];
    
    //设置子视图
    [self setupViews];
    
    //初始化scrollView
//    [self setupScrollView];
    
    //设置标题
//    [self setupTitleBtn];
}

#pragma mark - 滚动条标题
//- (void)setupTitleBtn
//{
//    NSInteger count = self.childViewControllers.count;
//    CGFloat btnX = 0;
//    CGFloat btnY = 0;
//    CGFloat btnH = 44;
//    CGFloat btnW = kScreenWidth / count;
//    
//    for (int i = 0; i < count; i++) {
//        
//        UIViewController *vc = self.childViewControllers[i];
//        UIButton *btn = [[UIButton alloc] init];
//        btnX = i * btnW;
//        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
//        [btn setTitle:vc.title forState:UIControlStateNormal];
//        
//        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        btn.titleLabel.font = [UIFont systemFontOfSize:14];
//        btn.titleLabel.highlightedTextColor = [UIColor redColor];
//        
//        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
//        btn.tag = i;
//        [self.titleBtns addObject:btn];
//        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
//        
//        if (i == 0) {
//            [self btnClick:btn];
//        }
//        [self.titleScrollView addSubview:btn];
//    }
////}
//
//#pragma mark - 监听按钮点击
////- (void)btnClick:(UIButton *)btn
////{
////    //修改点击后的颜色
////    [self selectBtn:btn];
////    
////    //滚动到对应的位置
////    NSInteger index = btn.tag;
////    CGFloat offsetX = index * kScreenWidth;
////    self.contentScrollView.contentOffset = CGPointMake(offsetX, 0);
////    
////    //添加控制器的View
////    [self showVc:index];
////    
////    //设置按钮居中
//////    [self setupTitleBtnCenter:btn];
////    
////    
////}
//
//- (void)selectBtn:(UIButton *)btn
//{
//    _selButton.selected = NO;
//    _selButton.transform = CGAffineTransformIdentity;
//    [_selButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    _selButton = btn;
//    [btn setTitleColor:kNormalColor forState:UIControlStateSelected];
////    btn.transform = CGAffineTransformMakeScale(1.3, 1.3);
//    btn.selected = YES;
//    
//}
//
//- (void)showVc:(NSInteger)index
//{
//    CGFloat offsetX = index * kScreenWidth;
//    UIViewController *vc = (UIViewController *)self.childViewControllers[index];
//    if (vc.isViewLoaded) {
//        return;
//    }
//    
//    [self.contentScrollView addSubview:vc.view];
//    vc.view.frame = CGRectMake(offsetX, 0, kScreenWidth, kScreenHeight);
//}
//
//- (void)setupScrollView
//{
//    //标题区域
//    NSInteger count = self.childViewControllers.count;
//    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 44)];
//    scrollView.backgroundColor = [UIColor grayColor];
//    self.titleScrollView = scrollView;
//    [self.view addSubview:self.titleScrollView];
//    self.titleScrollView.showsHorizontalScrollIndicator = NO;
//    
//    //内容滚动区域
//    UIScrollView *contentScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 44, kScreenWidth, kScreenHeight-44-64)];
//    self.contentScrollView = contentScrollView;
//    [self.view addSubview:self.contentScrollView];
//    self.contentScrollView.showsHorizontalScrollIndicator = NO;
//    self.contentScrollView.contentSize = CGSizeMake(count * kScreenWidth, 0);
//    self.contentScrollView.pagingEnabled = YES;
//    self.contentScrollView.bounces = NO;
//    self.contentScrollView.delegate = self;
//
//}
//
//#pragma mark - UIScrollView代理
//
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    CGFloat currentPage = scrollView.contentOffset.x / kScreenWidth;
//    NSInteger leftIndex = currentPage;
//    NSInteger rightIndex = leftIndex + 1;
//    
//    UIButton *leftBtn = self.titleBtns[leftIndex];
//    UIButton *rightBtn;
//    
//    if (rightIndex < self.titleBtns.count) {
//        rightBtn = self.titleBtns[rightIndex];
//    }
//    
//    CGFloat rightScale = currentPage - leftIndex;
//    CGFloat leftScale = 1 - rightScale;
//    
////    leftBtn.transform = CGAffineTransformMakeScale(leftScale * 0.3 + 1, leftScale * 0.3 + 1);
////    rightBtn.transform = CGAffineTransformMakeScale(rightScale * .3 + 1, rightScale * .3 + 1);
//    
//    [leftBtn setTitleColor:[UIColor colorWithRed:leftScale green:leftScale blue:leftScale alpha:1] forState:UIControlStateNormal];
//    [rightBtn setTitleColor:[UIColor colorWithRed:rightScale green:0 blue:0 alpha:1] forState:UIControlStateNormal];
//}
//
//#pragma mark - 设置子控制器
//- (void)setupChildViewController
//{
//    CYRecommendViewController *recommendVc = [[CYRecommendViewController alloc] init];
//    recommendVc.title = @"推荐";
//    [self.Vcarr addObject:recommendVc];
//    [self addChildViewController:recommendVc];
//    
//    CYEvaluationViewController *evaluationVc = [[CYEvaluationViewController alloc] init];
//    evaluationVc.title = @"评测";
//    [self.Vcarr addObject:evaluationVc];
//    [self addChildViewController:evaluationVc];
//    
//    CYLoseWeightViewController *loseWeightVc = [[CYLoseWeightViewController alloc] init];
//    loseWeightVc.title = @"减肥";
//    [self.Vcarr addObject:loseWeightVc];
//    [self addChildViewController:loseWeightVc];
//    
//    CYSportViewController *sportVc = [[CYSportViewController alloc] init];
//    sportVc.title = @"体育";
//    [self.Vcarr addObject:sportVc];
//    [self addChildViewController:sportVc];
//
//}
//
- (void)setupViews
{
    if (self.titles.count == 0) {
        return;
    }
    if (self.titles.count != self.urls.count) {
        return;
    }
    for (int i = 0; i < self.urls.count; i++) {
        NSString *url = self.urls[i];
        NSString *title = self.titles[i];
        UIViewController *vc = [[UIViewController alloc] init];
        
    }
    
    WeakSelf(weakSelf);
    self.optionView.titles = self.titles.copy;
    self.optionView.homeHeaderOptionalViewItemClickHandle = ^(CYDiscoverTitleView *optionView, NSString *title, NSInteger currentIndex) {
        weakSelf.slideViewController.seletedIndex = currentIndex;
    };
    [self.slideViewController reloadData];
    
}

#pragma mark - CYCustomSlideViewControllerDelegate
- (NSInteger)numberOfChildViewControllersInSlideViewController:(CYCustomSlideViewController *)slideViewController
{
    return self.titles.count;
}

- (UIViewController *)slideViewController:(CYCustomSlideViewController *)slideViewController viewControllerAtIndex:(NSInteger)index
{
    return self.controllers[index];
}

- (void)customSlideViewController:(CYCustomSlideViewController *)slideViewController slideOffset:(CGPoint)slideOffset
{
    self.optionView.contentOffset = slideOffset;
}

- (CYDiscoverTitleView *)optionView
{
    if (!_optionalView) {
        CYDiscoverTitleView *optional = [[CYDiscoverTitleView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 40)];
        [self.view addSubview:optional];
        _optionalView = optional;
        optional.backgroundColor = [UIColor whiteColor];
    }
    return _optionalView;
}

- (CYCustomSlideViewController *)slideViewController
{
    if (!_slideViewController) {
        CYCustomSlideViewController *slide = [[CYCustomSlideViewController alloc] init];
        [self addChildViewController:slide];
        [self.view addSubview:slide.view];
        slide.view.frame = CGRectMake(0, self.optionalView.height, kScreenWidth, kScreenHeight - self.optionalView.height - kTopBarHeight - kTabBarHeight);
        slide.delegate = self;
        slide.dataSource = self;
        _slideViewController = slide;
    }
    return _slideViewController;
}

- (NSMutableArray *)controllers {
    if (!_controllers) {
        _controllers = [NSMutableArray array];
    }
    return _controllers;
}

- (NSMutableArray *)titles {
    if (!_titles) {
        _titles = [NSMutableArray new];
    }
    return _titles;
}

- (NSMutableArray *)urls {
    if (!_urls) {
        _urls = [NSMutableArray new];
    }
    return _urls;
}

- (void)setupItems
{
    self.navigationItem.title = @"发现";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"searchIcon"] style:UIBarButtonItemStylePlain target:self action:@selector(searchItemClick)];
}

// 点击搜索按钮
- (void)searchItemClick
{
    
}
//
//#pragma mark - 懒加载数组
//- (NSMutableArray *)Vcarr
//{
//    if (_Vcarr == nil) {
//        _Vcarr = [NSMutableArray array];
//    }
//    return _Vcarr;
//}
//- (NSMutableArray *)titleBtns
//{
//    if (_titleBtns == nil) {
//        _titleBtns = [NSMutableArray array];
//    }
//    return _titleBtns;
//}

//
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//
//
//
@end
