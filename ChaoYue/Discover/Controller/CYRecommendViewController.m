//
//  CYRecommendViewController.m
//  ChaoYue
//
//  Created by again on 2017/5/3.
//  Copyright © 2017年 again. All rights reserved.
//

#import "CYRecommendViewController.h"
#import "CYCycleView.h"
#import "CYDiscoverTableViewCell.h"
static NSString *rid = @"CYDiscoverTableViewCell";

@interface CYRecommendViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak,nonatomic) UITableView *tableView;

@end

@implementation CYRecommendViewController
- (UITableView *)tableView
{
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc] init];
        _tableView = tableView;
        [self.view addSubview:tableView];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor orangeColor];
    
    
    NSArray *arr = @[@"df", @"dafo", @"daf"];
    CYCycleView *cycleView = [[CYCycleView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 100) array:arr];
//    [self.view addSubview:cycleView];
    self.tableView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight - CGRectGetMaxY(cycleView.frame));
//    [self.view addSubview:self.tableView];
    [self.tableView addSubview:cycleView];
    NSLogRect(self.tableView.frame);
    [self.tableView registerNib:[UINib nibWithNibName:@"CYDiscoverTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:rid];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
}
#pragma mark - tableViewdelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CYDiscoverTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:rid];
//    if (cell == nil) {
//        cell = [[CYDiscoverTableViewCell alloc] init];
        cell.iconView.image = [UIImage imageNamed:@"userIcon"];
        cell.title.text = @"yudong";
        cell.subtitle.text = @"JianchiJianchiJianchiJianchiJianchanchiJianchiJianchanchiJianchiJianchanchiJianchiJianchanchiJianchiJianchanchiJianchiJianchanchiJianchiJianchi";
        cell.readCount.text = @"3423";
//    }
    return cell;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    UILabel *labe = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
    labe.backgroundColor = [UIColor clearColor];
    labe.textColor = kNormalColor;
    labe.tintColor = [UIColor clearColor];
    labe.text = @"推荐新闻";
    labe.font = kFont(10);
    return labe.text;
//    return @"推荐新闻";
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
