//
//  CYHistoryGameCell.m
//  ChaoYue
//
//  Created by again on 2017/5/9.
//  Copyright © 2017年 again. All rights reserved.
//

#import "CYHistoryGameCell.h"

@interface CYHistoryGameCell ()

/**比赛日期*/
@property (weak, nonatomic) IBOutlet UILabel *date;
/**比赛时间*/
@property (weak, nonatomic) IBOutlet UILabel *time;
/**A队logo*/
@property (weak, nonatomic) IBOutlet UIImageView *teamAImageView;
/**A队名称*/
@property (weak, nonatomic) IBOutlet UILabel *teamAname;
/**比赛分数*/
@property (weak, nonatomic) IBOutlet UILabel *score;
/**B队名称*/
@property (weak, nonatomic) IBOutlet UILabel *teamBname;
/**B队logo*/
@property (weak, nonatomic) IBOutlet UIImageView *teamBImageView;

@end
@implementation CYHistoryGameCell

+ (instancetype)CYHistoryCellWithTableView:(UITableView *)tableView
{
    static NSString *rid = @"CYHistoryCell";
    CYHistoryGameCell *cell = [tableView dequeueReusableCellWithIdentifier:rid];
    if (cell == nil) {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"CYHistoryCell" owner:nil options:nil]firstObject];
        
    }
    return cell;
}
@end
