//
//  CYStoreViewController.m
//  ChaoYue
//
//  Created by again on 2017/5/3.
//  Copyright © 2017年 again. All rights reserved.
//

#import "CYStoreViewController.h"
#import "SDCycleScrollView.h"

static NSString *rid = @"id";
@interface CYStoreViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (weak,nonatomic) UISearchBar *search;
@property (weak,nonatomic) SDCycleScrollView *collectionView;
@property (strong,nonatomic) NSArray *arr;
@property (weak,nonatomic) UITableView *tableView;


@end

@implementation CYStoreViewController

- (UITableView *)tableView
{
    if (_tableView == nil) {
        UITableView *table = [[UITableView alloc] initWithFrame:CGRectMake(0, 300, kScreenWidth, 500) style:UITableViewStyleGrouped];
        _tableView = table;
        _tableView.backgroundColor = kNormalColor;
        [self.view addSubview:table];
    }
    return _tableView;
}

- (SDCycleScrollView *)collectionView
{
    if (!_collectionView) {
        _collectionView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 44, kScreenWidth, 200) shouldInfiniteLoop:YES imageNamesGroup:self.arr];
    }
    return _collectionView;
}

- (UISearchBar *)search
{
    if (!_search) {
       UISearchBar *search = [[UISearchBar alloc] initWithFrame:CGRectMake(10, 10, kScreenWidth - 20, 24)];
        _search = search;
        search.placeholder = @"找你想要的";
        [search.layer setBorderWidth:1];
        search.layer.cornerRadius = 10;
        search.layer.masksToBounds = YES;
        [search.layer setBorderColor:kRGBColor(240, 240, 240).CGColor];
        search.tintColor = [UIColor lightGrayColor];
        search.showsCancelButton = YES;
        [self.view addSubview:search];
    }
    return _search;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    //设置导航栏
    [self setupItems];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.frame = CGRectMake(0, 300, kScreenWidth, kScreenHeight);
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 100, 0);
    self.tableView.contentOffset = CGPointMake(50, 100);
    self.tableView.backgroundColor = kNormalColor;
    self.tableView.contentSize = [self.tableView sizeThatFits:CGSizeMake(CGRectGetWidth(self.tableView.bounds), CGFLOAT_MAX)];
    //搜索框
    [self.view addSubview:self.search];
    self.search.barTintColor = kWhiteColor;
    
    NSArray *imageNames = @[@"baomin",
                            @"teamLogo.png",
                            @"plan",
                            @"star",
                            @"run"
                            ];
    self.arr = imageNames;
    self.collectionView.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.collectionView.pageControlStyle = SDCycleScrollViewPageContolStyleClassic;
    [self.collectionView setCurrentPageDotColor:kNormalColor];
    [self.view addSubview:self.collectionView];
    
}

#pragma mark - tableviewdelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *rid = @"d";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:rid];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:rid];
    }
    cell.textLabel.text = @"111";
    return cell;
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
}

@end
