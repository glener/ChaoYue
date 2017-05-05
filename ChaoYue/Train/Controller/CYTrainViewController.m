//
//  CYTrainViewController.m
//  ChaoYue
//
//  Created by again on 2017/5/3.
//  Copyright © 2017年 again. All rights reserved.
//

#import "CYTrainViewController.h"

@interface CYTrainViewController ()

@end

@implementation CYTrainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 22)];
    
//    self.navigationController.navigationBar.topItem =
    self.navigationItem.titleView = view;
    view.backgroundColor = kNormalColor;
    UIButton *btn1 = [[UIButton alloc] init];
    UIButton *btn2 = [[UIButton alloc] init];
    [btn1 setTitle:@"运动器材" forState:UIControlStateNormal];
    [btn2 setTitle:@"运动装备" forState:UIControlStateNormal];
    [btn1 setTitleColor:kWhiteColor forState:UIControlStateSelected];
    [btn2 setTitleColor:kWhiteColor forState:UIControlStateSelected];
    btn1.titleLabel.font = [UIFont systemFontOfSize:8];
    [view addSubview:btn1];
    [view addSubview:btn2];
    btn1.frame = CGRectMake(0, 0, 50, 22);
    btn2.frame = CGRectMake(50, 0, 50, 22);
    
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
