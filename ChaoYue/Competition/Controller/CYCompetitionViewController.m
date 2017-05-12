//
//  CYCompetitionViewController.m
//  ChaoYue
//
//  Created by again on 2017/5/3.
//  Copyright © 2017年 again. All rights reserved.
//

#import "CYCompetitionViewController.h"
#import "CYCompetitionToolView.h"
#import "CYCompetitionFirstView.h"
#import "CYHistoryGameCell.h"

@interface CYCompetitionViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (strong,nonatomic) CYCompetitionFirstView *firstView;
@property (strong,nonatomic) UITableView *historyTableVeiw;

@end

@implementation CYCompetitionViewController

- (CYCompetitionFirstView *)firstView
{
    if (!_firstView) {
        
    }
    return _firstView;
}

//- (void)viewDidLayoutSubviews
//{
//    
//            //
//}
- (UITableView *)historyTableVeiw
{
    if (!_historyTableVeiw) {
        _historyTableVeiw = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.firstView.frame) + 44, kScreenWidth, 88) style:UITableViewStylePlain];
        
        _historyTableVeiw.backgroundColor = kNormalColor;
    }
    return _historyTableVeiw;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupItems];
    [self setupView];
//    self.view.backgroundColor = kRGBColor(241, 241, 241);
    
    
    
    CYCompetitionFirstView *first = [[CYCompetitionFirstView alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, 200)];
    first.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGame)];
    [first addGestureRecognizer:tap];
    _firstView = first;
    [self.view addSubview:_firstView];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(120, CGRectGetMaxY(self.firstView.frame), 100, 44)];
    label.text = @"历史赛程";
    [self.view addSubview:label];
    
    //带下划线的按钮，可重构，设置成分类或类扩展？
    UIButton *more = [[UIButton alloc] initWithFrame:CGRectMake(250, CGRectGetMaxY(self.firstView.frame), 50, 50)];
    more.titleLabel.font = kFont(11);
    more.titleLabel.textColor = kNormalColor;
    //设置下划线
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSUnderlineStyleAttributeName] = [NSNumber numberWithInt:NSUnderlineStyleSingle];
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"更多" attributes:dict];
//    NSRange range = {0, str.length};
//    [str addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInt:NSUnderlineStyleSingle] range:range];
    [more setAttributedTitle:str forState:UIControlStateNormal];
    
    [self.view addSubview:more];
    
//    [self.historyTableVeiw registerNib:[UINib nibWithNibName:@"CYHistoryGameCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"CYHistoryGameCell"];
//    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.firstView.frame) + 2, kScreenWidth, 100) style:UITableViewStylePlain];
//    self.historyTableVeiw = tableView;
    //历史赛程
    self.historyTableVeiw.delegate = self;
     self.historyTableVeiw.dataSource = self;
    self.historyTableVeiw.scrollEnabled = NO;
    self.historyTableVeiw.userInteractionEnabled = NO;
    self.historyTableVeiw.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.historyTableVeiw];
    
    CYCompetitionToolView *toolView = [[CYCompetitionToolView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.historyTableVeiw.frame), kScreenWidth, 60)];
    [self.view addSubview:toolView];
    
    //投票
    UIView *vote = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(toolView.frame) + 10, kScreenWidth, kScreenHeight - CGRectGetMaxY(toolView.frame))];
    vote.backgroundColor = kNormalColor;
    
    UIButton *voteBtn = [[UIButton alloc] initWithFrame:CGRectMake(50, 0, 200, 30)];
    NSMutableAttributedString *votestr = [[NSMutableAttributedString alloc] initWithString:@"点击进入投票系统" attributes:dict];
    [voteBtn setAttributedTitle:votestr forState:UIControlStateNormal];
    
    UILabel *voteLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, CGRectGetMaxY(voteBtn.frame), 300, 20)];
    voteLabel.text = @"为你心目中的球队呐喊一声";
    [vote addSubview:voteLabel];
    [vote addSubview:voteBtn];
    [self.view addSubview:vote];
    
}

//监听赛事点击
- (void)tapGame
{
    
}

- (void)setupView
{

}

- (void)setupItems
{
    self.navigationItem.title = @"赛事";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"searchIcon"] style:UIBarButtonItemStylePlain target:self action:@selector(searchItemClick)];
}

#pragma mark - tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CYHistoryGameCell *cell = [CYHistoryGameCell CYHistoryCellWithTableView:self.historyTableVeiw];
    return  cell;
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
