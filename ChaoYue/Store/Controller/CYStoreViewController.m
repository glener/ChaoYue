//
//  CYStoreViewController.m
//  ChaoYue
//
//  Created by again on 2017/5/3.
//  Copyright © 2017年 again. All rights reserved.
//

#import "CYStoreViewController.h"

@interface CYStoreViewController ()

@end

@implementation CYStoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //设置导航栏
    [self setupItems];
    
    //搜索框
    UISearchBar *search = [[UISearchBar alloc] init];
//    search.barStyle = UISearchBarStyleProminent;
    [self.view addSubview:search];
    search.backgroundColor = [UIColor clearColor];
    search.frame = CGRectMake(0, 0, 320, 44);
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 44, kScreenWidth, 44)];
    [self.view addSubview:view];
    
    view.backgroundColor = [UIColor grayColor];
    view.userInteractionEnabled = YES;
    
    UIButton *btn1 = [[UIButton alloc] init];
    UIButton *btn2 = [[UIButton alloc] init];
    [btn1 setTitle:@"运动器材" forState:UIControlStateNormal];
    [btn2 setTitle:@"运动装备" forState:UIControlStateNormal];
    [btn1 setTitleColor:kNormalColor forState:UIControlStateSelected];
    [btn2 setTitleColor:kNormalColor forState:UIControlStateSelected];
    [view addSubview:btn1];
    [view addSubview:btn2];
    btn1.frame = CGRectMake(0, 0, 160, 34);
    btn2.frame = CGRectMake(160, 0, 160, 34);
    
    btn1.userInteractionEnabled = YES;
    
    
    
    
}

- (void)setupItems
{
    self.navigationItem.title = @"商城";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"searchIcon"] style:UIBarButtonItemStylePlain target:self action:@selector(searchItemClick)];
    
}

- (void)searchItemClick
{
    
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
