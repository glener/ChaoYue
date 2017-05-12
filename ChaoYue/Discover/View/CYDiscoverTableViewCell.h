//
//  CYDiscoverTableViewCell.h
//  ChaoYue
//
//  Created by again on 2017/5/12.
//  Copyright © 2017年 again. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CYDiscoverTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *subtitle;
@property (weak, nonatomic) IBOutlet UILabel *readCount;

@end
