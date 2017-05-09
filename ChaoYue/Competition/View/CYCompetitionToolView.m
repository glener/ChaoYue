//
//  CYCompttitionToolView.m
//  ChaoYue
//
//  Created by again on 2017/5/8.
//  Copyright © 2017年 again. All rights reserved.
//

#import "CYCompetitionToolView.h"
#import "CYCompetitionToolButton.h"

@interface CYCompetitionToolView ()
//报名按钮
@property (weak,nonatomic) UIButton *entryBtn;
//赛事安排按钮
@property (weak,nonatomic) UIButton *planBtn;
//赛果按钮
@property (weak,nonatomic) UIButton *resultBtn;
//人气明星按钮
@property (weak,nonatomic) UIButton *starBtn;

//按钮数组
@property (strong,nonatomic) NSMutableArray *btns;

@end
@implementation CYCompetitionToolView

- (NSMutableArray *)btns
{
    if (!_btns) {
        _btns = [NSMutableArray array];
    }
    return _btns;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = YES;
        //设置图片
        //        self.image = [UIImage resizedImageWithName:@"timeline_card_bottom_background_os7"];
        
        //添加按钮
        self.entryBtn = [self setBtnTitle:@"报名参赛" image:@"baomin" bgImage:@"" buttonType:(CYCompetionToolViewItemTypeEntry)];
        
        self.planBtn = [self setBtnTitle:@"赛事安排" image:@"plan" bgImage:@"" buttonType:(CYCompetionToolViewItemTypePlan)];
        
        self.resultBtn = [self setBtnTitle:@"赛果" image:@"saiguo" bgImage:@"" buttonType:(CYCompetionToolViewItemTypeResult)];
        
        self.starBtn = [self setBtnTitle:@"人气明星" image:@"star" bgImage:@"" buttonType:(CYCompetionToolViewItemTypeStar)];
        
    }
    return self;
}

- (void)btnClick:(CYCompetitionToolButton *)btn
{
    if ([self.delegate respondsToSelector:@selector(competitionToolView:buttonType:)]) {
        [self.delegate competitionToolView:self buttonType:btn.type];
    }
}

//设置工具条按钮
- (UIButton *)setBtnTitle:(NSString *)title image:(NSString *)image bgImage:(NSString *)bgImage buttonType:(CYCompetionToolViewItemType)buttonType
{
    CYCompetitionToolButton *btn = [[CYCompetitionToolButton alloc] init];
    btn.type = buttonType;
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    //    [btn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:kNormalColor forState:UIControlStateSelected];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:13];
    btn.adjustsImageWhenHighlighted = NO;
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    [self addSubview:btn];
    [self.btns addObject:btn];
    return btn;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat btnY = 0;
    CGFloat btnH = self.frame.size.height;
    NSInteger btnCount = self.btns.count;
    CGFloat btnW = self.frame.size.width / btnCount;
    for (int i = 0; i<btnCount; i++) {
        UIButton *btn = self.btns[i];
        CGFloat btnX = i * btnW;
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        //调整图标和文字上下关系
        btn.imageEdgeInsets = UIEdgeInsetsMake(btn.titleLabel.intrinsicContentSize.height - 40, 0, 0, -btn.titleLabel.intrinsicContentSize.width);
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, -btn.imageView.frame.size.width, -btn.imageView.frame.size.height, 0);
        
    }
 
//    [self setupBtn:self.stateBtn originalTitle:@"动态" count:3];
//    [self setupBtn:self.followBtn originalTitle:@"关注" count:3];
//    [self setupBtn:self.fansBtn originalTitle:@"粉丝" count:3];
}

//- (void)setupBtn:(UIButton *)btn originalTitle:(NSString *)originalTitle count:(NSInteger)count
//{
//    if (count) {
//        NSString *title = nil;
//        if (count<1000) {
//            title = [NSString stringWithFormat:@"%@ %zd", originalTitle, count];
//        } else {
//            double doubleCount = count /1000.0;
//            title = [NSString stringWithFormat:@"%@ %.1fk", originalTitle, doubleCount];
//            title = [title stringByReplacingOccurrencesOfString:@".0" withString:@""];
//        }
//        [btn setTitle:title forState:UIControlStateNormal];
//    } else {
//        [btn setTitle:originalTitle forState:UIControlStateNormal];
//    }
//}

@end
