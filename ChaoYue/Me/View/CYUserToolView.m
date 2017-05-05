//
//  CYUserToolView.m
//  ChaoYue
//
//  Created by again on 2017/5/4.
//  Copyright © 2017年 again. All rights reserved.
//

#import "CYUserToolView.h"
#import "CYUserHeaderToolButton.h"

@interface CYUserToolView ()

//动态按钮
@property (weak,nonatomic) UIButton *stateBtn;
//关注按钮
@property (weak,nonatomic) UIButton *followBtn;
//粉丝按钮
@property (weak,nonatomic) UIButton *fansBtn;
//分割线
@property (strong,nonatomic) NSMutableArray *dividers;

@property (strong,nonatomic) NSMutableArray *btns;
/** 按钮类型 */
//@property (nonatomic, assign) CYPersonalCenterHeaderItemType btnType;

@end
@implementation CYUserToolView

- (NSMutableArray *)btns
{
    if (!_btns) {
        _btns = [NSMutableArray array];
    }
    return _btns;
}

- (NSMutableArray *)dividers
{
    if (!_dividers) {
        _dividers = [NSMutableArray array];
    }
    return _dividers;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = YES;
        //设置图片
//        self.image = [UIImage resizedImageWithName:@"timeline_card_bottom_background_os7"];
        
        //添加按钮
        self.stateBtn = [self setBtnTitle:@"动态" image:@"run" bgImage:@"" buttonType:(CYPersonalCenterHeaderItemTypeState)];
        
        self.followBtn = [self setBtnTitle:@"动态" image:@"run" bgImage:@"" buttonType:(CYPersonalCenterHeaderItemTypeFollow)];
        
        self.fansBtn = [self setBtnTitle:@"动态" image:@"run" bgImage:@"" buttonType:(CYPersonalCenterHeaderItemTypeFans)];
        
//        self.followBtn = [self setBtnTitle:@"关注" image:@"run" bgImage:@""];
//        self.fansBtn = [self setBtnTitle:@"粉丝" image:@"run" bgImage:@""];
//        
        [self setupDivider];
        [self setupDivider];
        
    }
    return self;
}

- (void)btnClick:(CYUserHeaderToolButton *)btn
{
    if ([self.delegate respondsToSelector:@selector(userToolView:buttonType:)]) {
        [self.delegate userToolView:self buttonType:btn.type];
    }
}

//设置分割线
- (void)setupDivider
{
    UIImageView *divider = [[UIImageView alloc] init];
    divider.image = [UIImage imageNamed:@""];
    [self addSubview:divider];
    [self.dividers addObject:divider];
}

//设置工具条按钮
- (UIButton *)setBtnTitle:(NSString *)title image:(NSString *)image bgImage:(NSString *)bgImage buttonType:(CYPersonalCenterHeaderItemType)buttonType
{
    CYUserHeaderToolButton *btn = [[CYUserHeaderToolButton alloc] init];
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
    NSInteger dividerCount = self.dividers.count;
    CGFloat dividerW = 2;
    CGFloat btnW = (self.frame.size.width - dividerW * dividerCount) / btnCount;
    for (int i = 0; i<btnCount; i++) {
        UIButton *btn = self.btns[i];
        CGFloat btnX = i * (btnW + dividerW);
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
    }
    
    CGFloat dividerH = btnH;
    CGFloat dividerY = 0;
    for (int j = 0; j < dividerCount; j++) {
        UIImageView *divider = self.dividers[j];
        UIButton *btn = self.btns[j];
        CGFloat dividerX = CGRectGetMaxX(btn.frame);
        divider.frame = CGRectMake(dividerX, dividerY, dividerW, dividerH);
    }
    
    
    [self setupBtn:self.stateBtn originalTitle:@"动态" count:3];
    [self setupBtn:self.followBtn originalTitle:@"关注" count:3];
    [self setupBtn:self.fansBtn originalTitle:@"粉丝" count:3];
}

- (void)setupBtn:(UIButton *)btn originalTitle:(NSString *)originalTitle count:(NSInteger)count
{
    if (count) {
        NSString *title = nil;
        if (count<1000) {
            title = [NSString stringWithFormat:@"%@ %zd", originalTitle, count];
        } else {
            double doubleCount = count /1000.0;
            title = [NSString stringWithFormat:@"%@ %.1fk", originalTitle, doubleCount];
            title = [title stringByReplacingOccurrencesOfString:@".0" withString:@""];
        }
        [btn setTitle:title forState:UIControlStateNormal];
    } else {
        [btn setTitle:originalTitle forState:UIControlStateNormal];
    }
}

@end
