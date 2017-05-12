//
//  CYCycleView.m
//  ChaoYue
//
//  Created by again on 2017/5/12.
//  Copyright © 2017年 again. All rights reserved.
//


static NSString *rid = @"cycleViewCell";

#import "CYCycleView.h"

@interface CYCycleView ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (weak,nonatomic) UICollectionView *collectionView;
@property (strong,nonatomic) NSArray *array;
@property (weak,nonatomic) UIPageControl *pageControl;
@property (strong,nonatomic) NSTimer *timer;

@end
@implementation CYCycleView

- (instancetype)initWithFrame:(CGRect)frame array:(NSArray *)array
{
    if (self = [super initWithFrame:frame]) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.itemSize = CGSizeMake(kScreenWidth, 100);
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        self.array = array;
        //        layout.sectionInset  = UIEdgeInsetsMake(0, 0, 0, self.frame.size.width*self.arr.count);
        
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.frame collectionViewLayout:layout];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        collectionView.pagingEnabled = YES;
//        collectionView.backgroundColor = kNormalColor;
        [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:rid];
        
        _collectionView = collectionView;
        [self addSubview:collectionView];
        //设置页码点
        UIPageControl *pagecontrol = [[UIPageControl alloc] initWithFrame:CGRectMake(280, 80, 50, 100)];
        [pagecontrol sizeToFit];
        pagecontrol.numberOfPages = self.array.count;
        pagecontrol.currentPageIndicatorTintColor = kNormalColor;
        _pageControl = pagecontrol;
        [self addSubview:pagecontrol];
        
        [self addTimer];
    }
    return self;
}

- (void)addTimer
{
    NSTimer *timer = [NSTimer timerWithTimeInterval:3.0 target:self selector:@selector(scrollToNext) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    self.timer = timer;
}

- (void)removeTimer
{
    [self.timer invalidate];
    self.timer = nil;
}

- (void)scrollToNext
{
    CGFloat currentOffsetX = self.collectionView.contentOffset.x;
    CGFloat offsetX = currentOffsetX + self.collectionView.frame.size.width;
    [self.collectionView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
}

- (NSArray *)array
{
    if (!_array) {
        _array = [NSArray array];
    }
    return _array;
}

#pragma mark - collectionViewDatasource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.array.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:rid forIndexPath:indexPath];
    
//        cell = [[UICollectionViewCell alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth

//, 100)];
        NSLogRect(cell.frame);
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"userIcon"]];
        cell.backgroundView = imageView;

    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetX = scrollView.contentOffset.x + scrollView.bounds.size.width * 0.5;
    self.pageControl.currentPage = (int)(offsetX/scrollView.bounds.size.width);

}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self removeTimer];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self addTimer];
}
@end
