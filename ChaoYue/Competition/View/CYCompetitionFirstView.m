//
//  CYCompetitionFirstView.m
//  ChaoYue
//
//  Created by again on 2017/5/9.
//  Copyright © 2017年 again. All rights reserved.
//

#import "CYCompetitionFirstView.h"

@interface CYCompetitionFirstView ()
/**比赛时间*/
@property (weak,nonatomic) UILabel *gameTimeLabel;
@property (nonatomic, copy) NSString *gametime;
/**球队logo*/
@property (weak,nonatomic) UIImageView *teamALogoView;
@property (weak,nonatomic) UIImageView *teamBLogoView;
//@property (strong,nonatomic) NSMutableArray *logoArray;
/**球队名称*/
@property (weak,nonatomic) UILabel *teamANameLabel;
@property (weak,nonatomic) UILabel *teamBNameLabel;
//@property (strong,nonatomic) NSMutableArray *nameArray;
/**胜负场次*/
@property (weak,nonatomic) UILabel *teamAwinNumberLabel;
@property (weak,nonatomic) UILabel *teamBwinNumberLabel;
//@property (strong,nonatomic) NSMutableArray *winArray;
/**分数*/
@property (weak,nonatomic) UILabel *scoreLabel;
/**正在进行Label*/
@property (weak,nonatomic) UILabel *underwayLabel;
/**球队view*/
@property (weak,nonatomic) UIView *teamView;
/**分割线*/
@property (weak,nonatomic) UIView *divider;

@end

@implementation CYCompetitionFirstView

#pragma mark - 懒加载
//- (NSMutableArray *)logoArray
//{
//    if (!_logoArray) {
//        _logoArray = [NSMutableArray array];
//    }
//    return _logoArray;
//}
//- (NSMutableArray *)nameArray
//{
//    if (!_nameArray) {
//        _nameArray = [NSMutableArray array];
//    }
//    return _nameArray;
//}
//- (NSMutableArray *)winArray
//{
//    if (!_winArray) {
//        _winArray = [NSMutableArray array];
//    }
//    return _winArray;
//}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupView];
        //正在比赛label
        [self gameTime];
        
        //球队logo
        [self setupTeamLogoView];
        //球队名称和胜场
        [self setupTeamnameAndWinnumber];
        
        UILabel *score = [[UILabel alloc] init];
        score.text = @"96 - 96";
        score.font = kFont(36);
        self.scoreLabel = score;
        [self addSubview:score];
        
        UILabel *label = [[UILabel alloc] init];
        label.text = @"正在进行";
        label.textAlignment = NSTextAlignmentCenter;
        label.font = kFont(12);
        label.textColor = kWhiteColor;
        label.backgroundColor = kNormalColor;
        self.underwayLabel = label;
        [self addSubview:label];
        
        UIView *divider = [[UIView alloc] init];
        divider.backgroundColor = [UIColor grayColor];
        divider.alpha = 0.3;
        self.divider = divider;
        [self addSubview:divider];
        
    }
    return self;
}

//正在比赛label
- (void)gameTime
{
    UILabel *gameTime = [[UILabel alloc] init];
    self.gametime = @"9:30";
    gameTime.text = [_gametime stringByAppendingString:@" 开赛 正在比赛"];
    gameTime.textColor = kRGBColor(50, 50, 50);
    gameTime.font = kFont(13);
    self.gameTimeLabel = gameTime;
    [self addSubview:gameTime];
}

//球队名称和胜场
- (void)setupTeamnameAndWinnumber
{
    UILabel *name = [[UILabel alloc] init];
    UILabel *name1 = [[UILabel alloc] init];
    name.text = @"善德";
    name1.text = @"善德";
    name.font = kFont(13);
    name1.font = kFont(13);
    [self addSubview:name];
    [self addSubview:name1];
    self.teamANameLabel = name;
    self.teamBNameLabel = name1;
    
    UILabel *win = [[UILabel alloc] init];
    UILabel *win1 = [[UILabel alloc] init];
    win.text = @"胜61负21";
    win1.text = @"胜61负21";
    win.font = kFont(11);
    win1.font = kFont(11);
    [self addSubview:win];
    [self addSubview:win1];
    self.teamAwinNumberLabel = win;
    self.teamBwinNumberLabel = win1;
}

//球队logo
- (void)setupTeamLogoView
{
    UIImageView *logo = [[UIImageView alloc] init];
    logo.image = [UIImage imageNamed:@"teamlogo"];
    UIImageView *logo1 = [[UIImageView alloc] init];
    logo1.image = [UIImage imageNamed:@"teamlogo"];
    self.teamALogoView = logo;
    self.teamBLogoView = logo1;
    [self addSubview:logo];
    [self addSubview:logo1];
}

- (void)setupView
{
    //球队整体
//    CYCompetitionTeamView *teamView = [CYCompetitionTeamView teamView];
//    teamView.frame = CGRectMake(0, 100, 100, 100);
//    
//    self.teamView = teamView;
//    teamView.nameLabel.text = @"ealf";
//    NSLog(@"%@", self.teamView);
//    
//    [self addSubview:teamView];
}

//- (UIView *)teamView
//{
//    if (_teamView == nil) {
//        UIView *view = [[UIView alloc] init];
//        UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
//        self.teamLogoView = imageview;
//        imageview.image = [UIImage imageNamed:@"plan"];
//        
//        UILabel *namelabel = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(imageview.frame), _teamView.size.width, 30)];
//        self.teamNameLabel = namelabel;
//        
//        UILabel *winlabel = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(namelabel.frame), _teamView.size.width, 30)];
//        self.winNumberLabel = winlabel;
//        
//        _teamView = view;
//        [view addSubview:self.teamLogoView];
//        [view addSubview:self.teamNameLabel];
//        [view addSubview:self.winNumberLabel];
//    }
//    return _teamView;
//}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.gameTimeLabel.frame = CGRectMake((kScreenWidth - self.gameTimeLabel.intrinsicContentSize.width) / 2, 0, self.gameTimeLabel.intrinsicContentSize.width, 44);
    
//    self.teamLogoView.frame = CGRectMake(10, CGRectGetMaxY(self.gameTimeLabel.frame), 122, 66);
    self.teamALogoView.frame = CGRectMake(10, CGRectGetMaxY(self.gameTimeLabel.frame), 122, 66);
    self.teamBLogoView.frame = CGRectMake(kScreenWidth - CGRectGetMaxX(self.teamALogoView.frame), CGRectGetMinY(self.teamALogoView.frame), 122, 66);
    
    self.teamANameLabel.frame = CGRectMake((self.teamALogoView.frame.size.width - self.teamANameLabel.intrinsicContentSize.width) / 2 + 10, CGRectGetMaxY(self.teamALogoView.frame) + 10, self.teamANameLabel.intrinsicContentSize.width, self.teamANameLabel.intrinsicContentSize.height);
    self.teamBNameLabel.frame = CGRectMake((self.teamBLogoView.frame.size.width - self.teamBNameLabel.intrinsicContentSize.width) / 2 + self.teamBLogoView.x, CGRectGetMaxY(self.teamBLogoView.frame) + 10, self.teamBNameLabel.intrinsicContentSize.width, self.teamBNameLabel.intrinsicContentSize.height);

    self.teamAwinNumberLabel.frame = CGRectMake((self.teamALogoView.frame.size.width - self.teamAwinNumberLabel.intrinsicContentSize.width) / 2 + 10, CGRectGetMaxY(self.teamANameLabel.frame) + 5, self.teamAwinNumberLabel.intrinsicContentSize.width, self.teamAwinNumberLabel.intrinsicContentSize.height);
    self.teamBwinNumberLabel.frame = CGRectMake((self.teamBLogoView.frame.size.width - self.teamBwinNumberLabel.intrinsicContentSize.width) / 2 + self.teamBLogoView.x, CGRectGetMaxY(self.teamBNameLabel.frame) + 5, self.teamBwinNumberLabel.intrinsicContentSize.width, self.teamBwinNumberLabel.intrinsicContentSize.height);
//    self.teamView.frame = CGRectMake(0, 50, kScreenWidth, 200);
    
    self.scoreLabel.frame = CGRectMake((kScreenWidth - self.scoreLabel.intrinsicContentSize.width) / 2, CGRectGetMaxY(self.teamALogoView.frame), self.scoreLabel.intrinsicContentSize.width, self.scoreLabel.intrinsicContentSize.height);
    self.underwayLabel.frame = CGRectMake((kScreenWidth - self.underwayLabel.intrinsicContentSize.width - 10) / 2, CGRectGetMaxY(self.scoreLabel.frame) + 10, self.underwayLabel.intrinsicContentSize.width + 10, self.underwayLabel.intrinsicContentSize.height + 3);
    
    self.divider.frame = CGRectMake(10, CGRectGetMaxY(self.frame) - 5, kScreenWidth - 20, 1);
}

@end
