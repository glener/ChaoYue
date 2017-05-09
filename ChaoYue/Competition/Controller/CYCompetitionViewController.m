//
//  CYCompetitionViewController.m
//  ChaoYue
//
//  Created by again on 2017/5/3.
//  Copyright © 2017年 again. All rights reserved.
//

#import "CYCompetitionViewController.h"
#import "CYCompetitionToolView.h"

@interface CYCompetitionViewController ()

@end

@implementation CYCompetitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupItems];
    
    CYCompetitionToolView *toolView = [[CYCompetitionToolView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 60)];
    [self.view addSubview:toolView];
    
    
}

- (void)setupItems
{
    self.navigationItem.title = @"赛事";
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
