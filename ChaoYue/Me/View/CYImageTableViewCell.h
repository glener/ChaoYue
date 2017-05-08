//
//  CYImageTableViewCell.h
//  ChaoYue
//
//  Created by again on 2017/5/8.
//  Copyright © 2017年 again. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CYImageTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIScrollView *imageScrollView;
@property (weak, nonatomic) IBOutlet UILabel *imageDetaillabel;

@end
