//
//  CYUserImageView.h
//  ChaoYue
//
//  Created by again on 2017/5/4.
//  Copyright © 2017年 again. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CYPersonalCenterHeaderConstant.h"
#import "CYUserInfoModel.h"
@class CYUserHeaderView;
@protocol CYUserHeaderViewDelegate <NSObject>

- (void)userHeaderView:(CYUserHeaderView *)headerView didClickItemWithType:(CYPersonalCenterHeaderItemType)itemType;

@end

@interface CYUserHeaderView : UIView
@property (weak,nonatomic) id<CYUserHeaderViewDelegate> delegate;
@property (strong,nonatomic) CYUserInfoModel *userInfoModel;

@end
