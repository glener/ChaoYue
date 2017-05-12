//
//  CYCollectionView.m
//  ChaoYue
//
//  Created by again on 2017/5/10.
//  Copyright © 2017年 again. All rights reserved.
//

#import "CYCollectionView.h"

@implementation CYCollectionView

//- (UICollectionView *)collectionView
//{
//    if (!_collectionView) {
//        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
//        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
//        layout.itemSize = CGSizeMake(kScreenWidth, 100);
//        layout.minimumLineSpacing = 0;
//        layout.minimumInteritemSpacing = 0;
//        layout.sectionInset  = UIEdgeInsetsMake(0, 0, 0, self.view.frame.size.width*self.arr.count);
//
//        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 44, kScreenWidth, 100) collectionViewLayout:layout];
//        collectionView.delegate = self;
//        collectionView.dataSource = self;
//        collectionView.pagingEnabled = YES;
//
//
//        self.collectionView = collectionView;
//    }
//    return _collectionView;
//}

//- (void)setupCollectionPage
//{
//     [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:rid];
//    [self.view addSubview:self.collectionView];
//}

//#pragma mark - tableviewDelegate
//- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
//{
//    return 1;
//}
//
//- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
//{
//    return self.arr.count;
//}
//
//- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:rid forIndexPath:indexPath];
//    UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.arr[indexPath.item]]];
//    cell.backgroundView = image;
//    return cell;
//}

//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
//{
    //    NSInteger page = scrollView.contentOffset.x/scrollView.bounds.size.width;
    //    NSLog(@"滚动到：%zd",page);
    //
    //    NSLog(@"%f", scrollView.contentOffset.x);
    //    CGFloat contentofRight = scrollView.frame.size.width * (self.arr.count-1);
    ////    NSLog(@"%f", contentofRight);
    //    //到最右边
    //    if (contentofRight == scrollView.contentOffset.x) {
    //        NSIndexPath *path = [NSIndexPath indexPathForRow:1 inSection:0];
    //        [self.collectionView scrollToItemAtIndexPath:path atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    //    } else if (scrollView.contentOffset.x == 0) {//第一张图
    //        NSIndexPath *path = [NSIndexPath indexPathForRow:self.arr.count-2 inSection:0];
    //        [self.collectionView scrollToItemAtIndexPath:path atScrollPosition:UICollectionViewScrollPositionRight animated:NO];
    //    }
    
//    NSInteger page = scrollView.contentOffset.x/scrollView.bounds.size.width;
//    NSLog(@"滚动到：%zd",page);
//    if (page == 0) {//滚动到左边
//        scrollView.contentOffset = CGPointMake(scrollView.bounds.size.width * (self.arr.count - 2), 0);
//        //        _pageControl.currentPage = _titles.count - 2;
//    }else if (page == self.arr.count - 1){//滚动到右边
//        scrollView.contentOffset = CGPointMake(scrollView.bounds.size.width, 0);
//        //        _pageControl.currentPage = 0;
//    }else{
//        //        _pageControl.currentPage = page - 1;
//    }
//    
//}


@end
