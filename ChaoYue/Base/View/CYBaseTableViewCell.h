//
//  CYBaseTableViewCell.h
//  ChaoYue
//
//  Created by again on 2017/5/5.
//  Copyright © 2017年 again. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CYBaseTableViewCell : UITableViewCell
@property (weak,nonatomic) UITableView *tableView;
/** 创建不是xib的tableView*/
+ (instancetype)cellWithTableView:(UITableView *)tableView;

/** 创建从xib的tableView*/
+ (instancetype)nibCellWithTableView:(UITableView *)tableView;



@end
