//
//  CYMainTabbarViewController.m
//  ChaoYue
//
//  Created by again on 2017/5/3.
//  Copyright © 2017年 again. All rights reserved.
//

#import "CYMainTabbarViewController.h"
#import "CYBaseNavigationViewController.h"
//#import "CYTrainViewController.h"
#import "CYDiscoverViewController.h"
#import "CYCompetitionViewController.h"
#import "CYStoreViewController.h"
#import "CYMeViewController.h"

@interface CYMainTabbarViewController ()

@end

@implementation CYMainTabbarViewController

+ (void)initialize {
    
    // 设置为不透明
    [[UITabBar appearance] setTranslucent:NO];
//    [UITabBar appearance].clipsToBounds = NO;
    // 设置背景颜色
    [UITabBar appearance].barTintColor = kRGBAColor(241, 241, 241, 1);
    
    // 拿到整个导航控制器的外观
    UITabBarItem * item = [UITabBarItem appearance];
    //调整文字和icon的距离
    item.titlePositionAdjustment = UIOffsetMake(0, -5);
    
    // 普通状态
//    NSMutableDictionary * normalAtts = [NSMutableDictionary dictionary];
//    normalAtts[NSFontAttributeName] = [UIFont systemFontOfSize:10];
//    normalAtts[NSForegroundColorAttributeName] = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:1.00f];
//    [item setTitleTextAttributes:normalAtts forState:UIControlStateNormal];
    
    // 选中状态
    NSMutableDictionary *selectAtts = [NSMutableDictionary dictionary];
    selectAtts[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    selectAtts[NSForegroundColorAttributeName] = kNormalColor;
    [item setTitleTextAttributes:selectAtts forState:UIControlStateSelected];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self addChildViewControllerWithClassname:[CYTrainViewController description] imagename:@"train" title:@"训练"];
    [self addChildViewControllerWithClassname:[CYCompetitionViewController description]imagename:@"competition" title:@"赛事"];
    [self addChildViewControllerWithClassname:[CYDiscoverViewController description] imagename:@"discover" title:@"发现"];
    [self addChildViewControllerWithClassname:[CYStoreViewController description] imagename:@"store" title:@"商城"];
    [self addChildViewControllerWithClassname:[CYMeViewController description] imagename:@"me" title:@"我的"];
    
    
//    NHServiceListRequest *request = [NHServiceListRequest nh_request];
//    request.nh_url = kNHHomeServiceListAPI;
//    [request nh_sendRequestWithCompletion:^(id response, BOOL success, NSString *message) {
//        if (success) {
//            NHBaseNavigationViewController *homeNav = (NHBaseNavigationViewController *)self.viewControllers.firstObject;
//            NHHomeViewController *home = (NHHomeViewController *)homeNav.viewControllers.firstObject;
//            home.models = [NHServiceListModel modelArrayWithDictArray:response];
//        }
//    }];
}


// 添加子控制器
- (void)addChildViewControllerWithClassname:(NSString *)classname
                                  imagename:(NSString *)imagename
                                      title:(NSString *)title {
    
    UIViewController *vc = [[NSClassFromString(classname) alloc] init];
    CYBaseNavigationViewController *nav = [[CYBaseNavigationViewController alloc] initWithRootViewController:vc];
    
    nav.tabBarItem.title = title;
    nav.tabBarItem.image = [UIImage imageNamed:imagename];
    nav.tabBarItem.selectedImage = [[UIImage imageNamed:[imagename stringByAppendingString:@"_selected"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:nav];
}
@end
