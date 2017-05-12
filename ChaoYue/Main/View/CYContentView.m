//
//  CYContentView.m
//  ChaoYue
//
//  Created by again on 2017/5/11.
//  Copyright © 2017年 again. All rights reserved.
//

#import "CYContentView.h"

static NSString *rid = @"contentView";
static CGFloat starOffsetX = 0;

@interface CYContentView()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (strong,nonatomic) NSMutableArray *childVcs;
@property (strong,nonatomic) UIViewController *parantVC;
@property (weak,nonatomic) UICollectionView *collectionView;
@end

@implementation CYContentView

- (instancetype)initWithFrame:(CGRect)frame childVcs:(NSMutableArray *)childVcs parantsVc:(UIViewController *)parantsVc
{
    if (self = [super initWithFrame:frame]) {
        self.childVcs = childVcs;
        self.parantVC = parantsVc;
        
        //添加子控制器到父控制器中
        for ( int i = 0; i<childVcs.count; i++) {
            UIViewController *childVc = childVcs[i];
            [self.parantVC addChildViewController:childVc];
        }
        [self addSubview:self.collectionView];
//        [self.collectionView setContentInset:UIEdgeInsetsMake(-64, 0, 0, 0)];
    }
    return self;
}

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = self.bounds.size;
        layout.minimumLineSpacing = NO;
        layout.minimumInteritemSpacing = NO;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
        collectionView.showsHorizontalScrollIndicator = NO;
        [collectionView setPagingEnabled:YES];
        collectionView.bounces = NO;
        collectionView.delegate = self;
        collectionView.dataSource = self;
        collectionView.scrollsToTop = NO;
        [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:rid];
        
        _collectionView = collectionView;
        [self addSubview:collectionView];
    }
    return _collectionView;
}

#pragma mark - colledtionViewDatasource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.childVcs.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:rid forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UICollectionViewCell alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenWidth - 44)];
    }
    for (UIView *view in cell.contentView.subviews) {
        [view removeFromSuperview];
    }
    UIViewController *childVc = self.childVcs[indexPath.row];
    childVc.view.frame = cell.frame;
    [cell.contentView addSubview:childVc.view];
    return cell;
}
#pragma mark - uicollectionViewDelegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    starOffsetX = scrollView.contentOffset.x;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat progress = 0;
    NSInteger sourceIndex = 0;
    NSInteger targetIndex = 0;
    
    CGFloat currentOffsetX = scrollView.contentOffset.x;
    CGFloat scrollViewW = scrollView.bounds.size.width;
    if (currentOffsetX > scrollViewW) {
        sourceIndex = (int)(currentOffsetX / scrollViewW);
        targetIndex = sourceIndex + 1;
        if (targetIndex >= self.childVcs.count) {
            targetIndex = self.childVcs.count - 1;
        }
        if (currentOffsetX - starOffsetX == scrollViewW) {
            progress = 1;
            targetIndex = sourceIndex;
        }
        
    } else {
        progress = 1 - (currentOffsetX / scrollViewW - floor(currentOffsetX / scrollViewW));
        targetIndex = (int)(currentOffsetX / scrollViewW);
        sourceIndex = targetIndex + 1;
        if (sourceIndex >= self.childVcs.count) {
            sourceIndex = self.childVcs.count -1;
        }
    }
    if ([self.delegate respondsToSelector:@selector(contentView:progress:sourceIndex:targetIndex:)]) {
        [self.delegate contentView:self progress:progress sourceIndex:sourceIndex targetIndex:targetIndex];
    }
}


//设置点击后滚动
- (void)setCurrentIndex:(NSInteger)index
{
    CGFloat offsetX = index * self.collectionView.frame.size.width;
    [self.collectionView setContentOffset:CGPointMake(offsetX, 0)];
}

- (NSMutableArray *)childVcs
{
    if (!_childVcs) {
        _childVcs = [NSMutableArray array];
    }
    return _childVcs;
}

@end
