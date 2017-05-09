//
//  CYCompttitionToolView.h
//  ChaoYue
//
//  Created by again on 2017/5/8.
//  Copyright © 2017年 again. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CYCompetionToolConstant.h"

@class CYCompetitionToolView;


@protocol CYCompetitionToolViewDelegate <NSObject>

- (void)competitionToolView:(CYCompetitionToolView *)tooView buttonType:(CYCompetionToolViewItemType)buttonType;

@end
@interface CYCompetitionToolView : UIView

@property (weak,nonatomic) id<CYCompetitionToolViewDelegate> delegate;
@end

