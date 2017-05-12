//
//  CYPageTitleView.m
//  ChaoYue
//
//  Created by again on 2017/5/10.
//  Copyright © 2017年 again. All rights reserved.
//

#import "CYPageTitleView.h"

static NSInteger KScrollLineH = 2;
static NSInteger currentIndex = 0;

@interface CYPageTitleView ()
@property (weak,nonatomic) UIScrollView *scrollView;
@property (strong,nonatomic) NSMutableArray *labels;
@property (weak,nonatomic) UIView *scrollLine;

@end

@implementation CYPageTitleView

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles
{
    self = [super initWithFrame:frame];
    if (self) {
        //添加scrollView
        [self setupScrollView];
//        NSLogRect(self.scrollView.frame);
        //设置label
        NSInteger count  = titles.count;
        
        CGFloat labelW = kScreenWidth/count;
        CGFloat labelH = frame.size.height - KScrollLineH;
        CGFloat labelY = 0;
        for (int i = 0; i<count; i++) {
            UILabel *label = [[UILabel alloc] init];
            label.userInteractionEnabled = YES;
            [self.labels addObject:label];
            label.tag = i;
            label.text = titles[i];
            CGFloat labelX = i * labelW;
//            label.textColor = kRGBColor(44, 44, 44);
            label.font = kFont(17);
            label.textAlignment = NSTextAlignmentCenter;
            label.frame = CGRectMake(labelX, labelY, labelW, labelH);
            [self.scrollView addSubview:label];
//            NSLogRect(label.frame);
            label.backgroundColor = kWhiteColor;
//            NSLog(@"%ld", self.scrollView.subviews.count);
            
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelClick:)];
            [label addGestureRecognizer:tap];
//            [self labelClick:tap];
        }
       //添加底部滚动线条
        UIView *scrollLine = [[UIView alloc] init];
        UILabel *firstLabel = self.labels[0];
//        NSLogRect(firstLabel.frame);
//        NSLogPoint(firstLabel.origin);
//        NSLog(@"%ld", self.labels.count);
        firstLabel.textColor = kNormalColor;
        
        CGFloat scrollLineH = KScrollLineH - 1 ;
        CGFloat scrollLineX = firstLabel.origin.x;
        CGFloat scrollLineW = firstLabel.size.width;
        CGFloat scrollLineY = self.frame.size.height - KScrollLineH;
        scrollLine.frame = CGRectMake(scrollLineX, scrollLineY, scrollLineW, scrollLineH);
        scrollLine.backgroundColor = kNormalColor;
//        self.scrollLine = scrollLine;
//        NSLogRect(scrollLine.frame);
        ;        [self.scrollView addSubview:scrollLine];
    }
    return self;
}

- (void)setupScrollView
{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    self.scrollView = scrollView;
    [self addSubview:scrollView];
    
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.scrollsToTop = NO;
    scrollView.bounces = NO;
}

- (void)setTitleWithProgress:(CGFloat)progress sourceIndex:(NSUInteger)sourceIndex targetIndex:(NSInteger)targetIndex
{
    UILabel *sourceLabel = self.labels[sourceIndex];
    UILabel *targetLabel = self.labels[targetIndex];

    CGFloat moveTotalX = targetLabel.frame.origin.x - sourceLabel.frame.origin.x;
    CGFloat moveX = moveTotalX * progress;
    [self.scrollLine setOrigin:CGPointMake(sourceLabel.frame.origin.x + moveX, self.frame.size.height - KScrollLineH)];
    targetLabel.textColor = kNormalColor;

        sourceLabel.textColor = [UIColor grayColor];
    
//    let colorDelta = (kSelectColor.0 - kNormalColor.0, kSelectColor.1 - kNormalColor.1, kSelectColor.2 - kNormalColor.2)
//    
//    // 3.2.变化sourceLabel
//    sourceLabel.textColor = UIColor(r: kSelectColor.0 - colorDelta.0 * progress, g: kSelectColor.1 - colorDelta.1 * progress, b: kSelectColor.2 - colorDelta.2 * progress)
//    
//    // 3.2.变化targetLabel
//    targetLabel.textColor = UIColor(r: kNormalColor.0 + colorDelta.0 * progress, g: kNormalColor.1 + colorDelta.1 * progress, b: kNormalColor.2 + colorDelta.2 * progress)
    

    currentIndex = targetIndex;
}

- (void)labelClick:(UITapGestureRecognizer *)tap
{
    UILabel *currentLabel = (UILabel *)tap.view;
    if (currentLabel.tag == currentIndex) { return;}
    UILabel *oldLabel = self.labels[currentIndex];
    oldLabel.textColor = [UIColor grayColor];
    currentLabel.textColor = kNormalColor;
    currentIndex = currentLabel.tag;
    
    CGFloat scrollLineX = currentIndex * self.scrollLine.width;
    [UIView animateWithDuration:0.15 animations:^{
        [self.scrollLine setOrigin:CGPointMake(scrollLineX, self.scrollView.frame.size.height - KScrollLineH)];
    }];
    if ([self.delegate respondsToSelector:@selector(pageTitleView:selectIndex:)]) {
        [self.delegate pageTitleView:self selectIndex:currentIndex];
    }
}

- (NSMutableArray *)labels
{
    if (!_labels) {
        _labels = [NSMutableArray array];
    }
    return _labels;
}

@end
