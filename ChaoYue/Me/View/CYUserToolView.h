//
//  CYUserToolView.h
//  ChaoYue
//
//  Created by again on 2017/5/4.
//  Copyright © 2017年 again. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CYPersonalCenterHeaderConstant.h"

@class CYUserToolView;

@protocol CYUserToolViewDelegate <NSObject>

- (void)userToolView:(CYUserToolView *)tooView buttonType:(CYPersonalCenterHeaderItemType)buttonType;

@end

@interface CYUserToolView : UIImageView
@property (weak,nonatomic) id<CYUserToolViewDelegate> delegate;
@property (nonatomic, assign) NSInteger state_count;
@property (nonatomic, assign) NSInteger follow_count;
@property (nonatomic, assign) NSInteger fans_count;
@end
