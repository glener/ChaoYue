//
//  CYDefaultHeader.h
//  ChaoYue
//
//  Created by again on 2017/5/3.
//  Copyright © 2017年 again. All rights reserved.
//

#ifndef CYDefaultHeader_h
#define CYDefaultHeader_h

/***  当前屏幕宽度 */
#define kScreenWidth  [[UIScreen mainScreen] bounds].size.width
/***  当前屏幕高度 */
#define kScreenHeight  [[UIScreen mainScreen] bounds].size.height
/***  普通字体 */
#define kFont(size) [UIFont systemFontOfSize:size]
/***  粗体 */
#define kBoldFont(size) [UIFont boldSystemFontOfSize:size]
/***  普通字体 */
#define kFont(size) [UIFont systemFontOfSize:size]

/** 普通绿色颜色 */
#define kNormalColor [UIColor colorWithRed:36/255.0 green:198/255.0 blue:138/255.0 alpha:1]
#define kWhiteColor [UIColor colorWithRed:1 green:1 blue:1 alpha:1]

#define kRGBAColor(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define kRGBColor(r,g,b) kRGBAColor(r,g,b,1.0f)
#define kSeperatorColor kRGBColor(234,237,240)
/**************/

#define kCommonHighLightRedColor [UIColor colorWithRed:1.00f green:0.49f blue:0.65f alpha:1.00f]
#define kCommonBlackColor [UIColor colorWithRed:0.17f green:0.23f blue:0.28f alpha:1.00f]

#define kLineHeight (1 / [UIScreen mainScreen].scale)

#define kTabBarHeight 49
#define kTopBarHeight 64

//弱指针
#define WeakSelf(weakSelf)  __weak __typeof(&*self)weakSelf = self;

/** 打印位置宏*/
#define NSLogRect(rect) NSLog(@"%s x:%.4f,                     y:%.4f, w:%.4f, h:%.4f", #rect, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height)
#define NSLogSize(size) NSLog(@"%s w:%.4f, h:%.4f", #size, size.width, size.height)
#define NSLogPoint(point) NSLog(@"%s x:%.4f, y:%.4f", #point, point.x, point.y)
#endif /* CYDefaultHeader_h */
