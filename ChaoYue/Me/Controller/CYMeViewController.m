//
//  CYMeViewController.m
//  ChaoYue
//
//  Created by again on 2017/5/3.
//  Copyright © 2017年 again. All rights reserved.
//

#import "CYMeViewController.h"
//#import "CYUserToolView.h"
#import "CYUserHeaderView.h"
#import "CYSettingViewController.h"
#import "CYRemindViewController.h"
#import "CYStateViewController.h"
#import "CYFollowViewController.h"
#import "CYFansViewController.h"

@interface CYMeViewController ()<CYUserHeaderViewDelegate>
@property (nonatomic, copy) NSString *userImage;
//@property (strong,nonatomic) CYUserToolView *userToolView;
@property (strong,nonatomic) CYUserHeaderView *userHeaderView;
@property (strong,nonatomic) UITableView *tableView;

@end

@implementation CYMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //移动下来时取消透明度
    self.navigationController.navigationBar.translucent = YES;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"searchIcon"] style:UIBarButtonItemStylePlain target:self action:@selector(settingItemClick)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"searchIcon"] style:UIBarButtonItemStylePlain target:self action:@selector(messageItemClick)];
    
    //背景图片
//    UIImageView *backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"userImage"]];
//    self.backgroundImage = backgroundImage;
//    backgroundImage.frame = CGRectMake(0, 0, kScreenWidth, 200);
//    [self.tableView addSubview:backgroundImage];
//    backgroundImage.contentMode = UIViewContentModeScaleAspectFill;
//    backgroundImage.clipsToBounds = YES;
    
    
//    userBackgroundView.frame = CGRectMake(0, 0, kScreenWidth, userBackgroundView.frame.size.height);
//    userBackgroundView.backgroundColor = kRGBColor(50, 50, 50);
//    self.userHeaderView = userBackgroundView;
   
    self.userHeaderView.contentMode = UIViewContentModeScaleAspectFill;
    
//    [self.tableView addSubview:userBackgroundView];
    
//    CYUserToolView *toolView = [[CYUserToolView alloc] initWithFrame:CGRectMake(0, userBackgroundView.frame.size.height, kScreenWidth, 44)];
//    self.userToolView = toolView;
//    [self.tableView addSubview:toolView];
//    toolView.backgroundColor = [UIColor whiteColor];
//    self.tableView.backgroundColor = [UIColor grayColor];
   
    
    [self.view addSubview:self.tableView];
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.tableView.contentOffset = CGPointMake(0, 0);
    self.tableView.contentSize = CGSizeMake(kScreenWidth, 500);
    
    
    //设置头部不偏移64
     self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (CYUserHeaderView *)userHeaderView
{
    if (!_userHeaderView) {
        _userHeaderView = [[CYUserHeaderView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 244)];
         self.tableView.tableHeaderView = _userHeaderView;
        
        _userHeaderView.delegate = self;
    }
    return _userHeaderView;
}
#pragma mark - tableViewDelegate
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return 1;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
        return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 50)];
        view.backgroundColor = [UIColor redColor];
        return view;
    } else {return nil;}
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *rid = @"";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:rid];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithFrame:self.view.frame];
    }
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    CGFloat y =  scrollView.contentOffset.y ;
//    NSLogRect(self.userImageView.backgroundImage.frame);
//    NSLog(@"%f----", scrollView.contentOffset.y);
////    if (y >-100) {
////        CGRect frame = self.userImageView.backgroundImage.frame;
////        frame.origin.y = y;
////        frame.size.height = -y;
////        self.userImageView.backgroundImage.frame = frame;
////    }
//    
//    CGRect newFrame = self.userImageView.backgroundImage.frame;
//    CGFloat settingViewOffsetY = 50 - scrollView.contentOffset.y;
//    newFrame.size.height = settingViewOffsetY;
////
//    if (settingViewOffsetY < 50) {
//        newFrame.size.height = 200;
//    }
//    self.userImageView.backgroundImage.frame = newFrame;
}

- (void)LayoutSubviews
{
    
}

//点击设置按钮
- (void)settingItemClick
{
    CYSettingViewController *set = [[CYSettingViewController alloc] init];
    [self.navigationController pushViewController:set animated:YES];
}

//点击消息按钮
- (void)messageItemClick
{
    CYRemindViewController *remind = [[CYRemindViewController alloc] init];
    [self.navigationController pushViewController:remind animated:YES];
}

- (UITableView *)tableView
{
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView = tableView;
    }
    return _tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - CYUserHeaderViewDelegate
- (void)userHeaderView:(CYUserHeaderView *)headerView didClickItemWithType:(CYPersonalCenterHeaderItemType)itemType
{
    //动态
    if (itemType == CYPersonalCenterHeaderItemTypeState) {
        CYStateViewController *state = [[CYStateViewController alloc] init];
        [self pushVc:state];
    } else if (itemType == CYPersonalCenterHeaderItemTypeFollow) {
        CYFollowViewController *follow = [[CYFollowViewController alloc] init];
        [self pushVc:follow];
    } else if (itemType == CYPersonalCenterHeaderItemTypeFans) {
        CYFansViewController *fans = [[CYFansViewController alloc] init];
        [self pushVc:fans];
    }
}



@end
