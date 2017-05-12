//
//  CYDiscoverController.m
//  ChaoYue
//
//  Created by again on 2017/5/11.
//  Copyright © 2017年 again. All rights reserved.
//

#import "CYDiscoverController.h"

@interface CYDiscoverController ()

@end

@implementation CYDiscoverController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.navigationController.navigationBar.translucent = YES;
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, 20)];
        NSLogPoint(self.view.origin);
        view.backgroundColor = kRGBColor(55, 243, 55);
        [self.view addSubview:view];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
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
