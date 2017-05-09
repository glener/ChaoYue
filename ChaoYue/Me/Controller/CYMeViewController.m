//
//  CYMeViewController.m
//  ChaoYue
//
//  Created by again on 2017/5/3.
//  Copyright © 2017年 again. All rights reserved.
//

#import "CYMeViewController.h"
#import "CYUserHeaderView.h"
#import "CYSettingViewController.h"
#import "CYRemindViewController.h"
#import "CYStateViewController.h"
#import "CYFollowViewController.h"
#import "CYFansViewController.h"
#import "CYSignTableViewCell.h"
#import "CYImageTableViewCell.h"


@interface CYMeViewController ()<CYUserHeaderViewDelegate, UITextFieldDelegate>
@property (nonatomic, copy) NSString *userImage;
@property (strong,nonatomic) CYUserHeaderView *userHeaderView;
@property (strong,nonatomic) UITableView *tableView;
@property (weak,nonatomic) CYSignTableViewCell *cell1;
@property (weak,nonatomic) CYImageTableViewCell *cell2;

@end

@implementation CYMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //移动下来时取消透明度
    self.navigationController.navigationBar.translucent = YES;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"searchIcon"] style:UIBarButtonItemStylePlain target:self action:@selector(settingItemClick)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"searchIcon"] style:UIBarButtonItemStylePlain target:self action:@selector(messageItemClick)];
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(userIconDidClick)];
    self.userHeaderView.userIcon.userInteractionEnabled = YES;
    [self.userHeaderView.userIcon addGestureRecognizer:tap];
    
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
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 100, 0);
    self.tableView.contentOffset = CGPointMake(0, 0);
    self.tableView.contentSize = CGSizeMake(kScreenWidth, 500);
    self.tableView.separatorInset = UIEdgeInsetsZero;
    
    //设置头部不偏移64
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView.backgroundView addSubview:self.userHeaderView.backgroundImage];
}

- (void)userIconDidClick
{
    
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

#pragma mark - textfield
//textfield的确认按钮点击后
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.view endEditing:YES];
    return YES;
}

#pragma mark - tableViewDelegate
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return 1;
//}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
        return 8;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{

        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 50)];
        view.backgroundColor = kRGBColor(222, 222, 222);
        return view;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:rid forIndexPath:indexPath];
//    UITableViewCell *cell1 = [tableView registerNib:<#(nullable UINib *)#> forCellReuseIdentifier:<#(nonnull NSString *)#>
    
//    static NSString *signCell = @"CYSignTableViewCell";
//    static NSString *imageCell = @"CYImageTableViewCell";
    
//    [self.tableView registerNib:[UINib nibWithNibName:signCell bundle:[NSBundle mainBundle]] forCellReuseIdentifier:signCell];
//    [self.tableView registerNib:[UINib nibWithNibName:imageCell bundle:[NSBundle mainBundle]] forCellReuseIdentifier:imageCell];
    
        if (indexPath.row == 0) {
            CYSignTableViewCell *cell = [[CYSignTableViewCell alloc] init];
//            if (cell == nil) {
                cell.SignTextField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 15, 0)];
                cell.SignTextField.leftViewMode = UITextFieldViewModeAlways;
                cell.SignTextField.font = kFont(13);
                cell.SignTextField.placeholder = @"这家伙很懒，什么也没留下。。。";
                cell.accessoryType = UITableViewCellAccessoryNone;
            [cell.SignTextField addTarget:self action:@selector(signTextFieldDidChange:) forControlEvents:UIControlEventEditingDidEnd];
            cell.SignTextField.delegate = self;
            return cell;
//            }
        } else if (indexPath.row == 1) {
            CYImageTableViewCell *cell = [[CYImageTableViewCell alloc] init];
            cell.imageDetaillabel.text = @"8个相册";
            UIScrollView *scr = [[UIScrollView alloc] init];
            scr.backgroundColor = kNormalColor;
            cell.imageScrollView = scr;
            return cell;
        } else {
            static NSString *rid = @"";
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:rid];
            if (cell == nil) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:rid];
                cell.textLabel.text = @"运动";
                cell.detailTextLabel.text = @"2项运动";
                cell.textLabel.font = kFont(14);
                cell.detailTextLabel.font = kFont(11);
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                cell.layoutMargins = UIEdgeInsetsZero;
            }
            return cell;
        }
//    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 1) {
        return 100;
    } else return 30;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 1) {
//        UIScrollView *scroll= [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 100)];
//        
//        [tableView addSubview:scroll];
//        
//        scroll.backgroundColor =  kNormalColor;
    }
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
    
    CGFloat y =  scrollView.contentOffset.y ;
//    if (y >-100) {
//        CGRect frame = self.userImageView.backgroundImage.frame;
//        frame.origin.y = y;
//        frame.size.height = -y;
//        self.userImageView.backgroundImage.frame = frame;
//    }
    if (y<0) {
        
//        CGRect newFrame = self.userHeaderView.backgroundImage.frame;
        CGRect frame = self.userHeaderView.backgroundImage.frame;
//        frame.origin.y = y;
        CGFloat settingViewOffsetY = 200 - scrollView.contentOffset.y;
        frame.size.height = settingViewOffsetY;
        self.userHeaderView.backgroundImage.frame = frame;
    }
//
//    if (settingViewOffsetY < 50) {
//        newFrame.size.height = 200;
//    }
}

- (void)signTextFieldDidChange:(UITextField *)textField
{
//    NSLog(@"%@----", textField.text);
    
}

- (void)LayoutSubviews
{
    
}

//点击设置按钮
- (void)settingItemClick
{
    CYSettingViewController *set = [[CYSettingViewController alloc] init];
    
    set.view.backgroundColor = kWhiteColor;
    [self.navigationController pushViewController:set animated:YES];
}

//点击消息按钮
- (void)messageItemClick
{
    CYRemindViewController *remind = [[CYRemindViewController alloc] init];
    remind.view.backgroundColor = kWhiteColor;
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
        state.view.backgroundColor = kWhiteColor;
        [self pushVc:state];
    } else if (itemType == CYPersonalCenterHeaderItemTypeFollow) {
        CYFollowViewController *follow = [[CYFollowViewController alloc] init];
        follow.view.backgroundColor = kWhiteColor;
        [self pushVc:follow];
    } else if (itemType == CYPersonalCenterHeaderItemTypeFans) {
        CYFansViewController *fans = [[CYFansViewController alloc] init];
        fans.view.backgroundColor = kWhiteColor;
        [self pushVc:fans];
    }
}



@end
