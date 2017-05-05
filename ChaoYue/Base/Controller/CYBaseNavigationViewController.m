//
//  CYBaseNavigationViewController.m
//  ChaoYue
//
//  Created by again on 2017/5/3.
//  Copyright © 2017年 again. All rights reserved.
//

#import "CYBaseNavigationViewController.h"

@interface CYBaseNavigationViewController ()

@end

@implementation CYBaseNavigationViewController

+ (void)initialize {
    // 设置为不透明
    [[UINavigationBar appearance] setTranslucent:NO];
    //去底下黑线
    [UINavigationBar appearance].clipsToBounds = NO;
    // 设置导航栏背景颜色
    [UINavigationBar appearance].barTintColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
    // 设置导航栏标题文字颜色
    // 创建字典保存文字大小和颜色
    NSMutableDictionary * color = [NSMutableDictionary dictionary];
    color[NSFontAttributeName] = kFont(17.0f);
    color[NSForegroundColorAttributeName] = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.00f];;
    [[UINavigationBar appearance] setTitleTextAttributes:color];
    
    // 拿到整个导航控制器的外观
    UIBarButtonItem * item = [UIBarButtonItem appearance];
    item.tintColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.00f];
    // 设置字典的字体大小
    NSMutableDictionary * atts = [NSMutableDictionary dictionary];
    
    atts[NSFontAttributeName] = [UIFont systemFontOfSize:17];
    atts[NSForegroundColorAttributeName] = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.00f];
    // 将字典给item
    [item setTitleTextAttributes:atts forState:UIControlStateNormal];
//
    
    [[UINavigationBar appearance] setShadowImage:[UIImage new]];
    [[UINavigationBar appearance] setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
