//
//  CYUserImageView.m
//  ChaoYue
//
//  Created by again on 2017/5/4.
//  Copyright © 2017年 again. All rights reserved.
//

#import "CYUserHeaderView.h"
#import "CYUserToolView.h"

@interface CYUserHeaderView ()<CYUserToolViewDelegate>
/** 城市*/
@property (weak,nonatomic) UILabel *cityLabel;
/** 昵称*/
@property (weak,nonatomic) UILabel *nameLabel;
/** */
@property (weak,nonatomic) UIImageView *whiteIcon;

/** 动态，关注，粉丝 */
@property (weak,nonatomic) CYUserToolView *userToolView;

@end
@implementation CYUserHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = YES;
        
        UIImageView *backgroundImage = [[UIImageView alloc] init];
        backgroundImage.image = [UIImage imageNamed:@"userIcon"];
        
//        CIImage *image = [[CIImage alloc] initWithImage:backgroundImage.image];
//        CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"];
//        [filter setValue:image forKey:kCIInputImageKey];
//        [filter setValue:@5 forKey:@"inputRadius"];
//        CIImage *outImage = [filter valueForKey:kCIOutputImageKey];
//        CIContext *context = [CIContext contextWithOptions:nil];
//        CGImageRef outCGimageref = [context createCGImage:outImage fromRect:[outImage extent]];
//        
//        UIImage *resultImage = [UIImage imageWithCGImage:outCGimageref];
//        CGImageRelease(outCGimageref);
//        [backgroundImage setImage:resultImage];
        
        
        self.backgroundImage.contentMode = UIViewContentModeScaleAspectFill;
        self.backgroundImage.alpha = 0.9;
        
        _backgroundImage = backgroundImage;
        backgroundImage.layer.masksToBounds = YES;
    
        [self addSubview:backgroundImage];
        
        
        

        //创建用户名及签名
        
        //创建底部工具条
        CYUserToolView *userToolView = [[CYUserToolView alloc] init];
        self.userToolView = userToolView;
        self.userToolView.delegate = self;
        [self addSubview:userToolView];
    }
    return self;
}

- (void)userIconDidClick
{
    
}

//背景图片
//- (UIImageView *)backgroundImage
//{
//    if (!_backgroundImage) {
//        UIImageView *backgroundImage = [[UIImageView alloc] init];
//        
//        backgroundImage.image = [UIImage imageNamed:@"userImage.png"];
//        self.backgroundImage.contentMode = UIViewContentModeScaleAspectFill;
//        
//        _backgroundImage = backgroundImage;
//        backgroundImage.layer.masksToBounds = YES;
//        [self addSubview:backgroundImage];
//    }
//    return _backgroundImage;
//}

//创建头像圆形
- (UIImageView *)userIcon
{
    if (!_userIcon) {
        UIImageView *userIcon =  [[UIImageView alloc] init];
        self.userIcon = userIcon;
        userIcon.layer.borderColor = [kWhiteColor CGColor];
        userIcon.layer.borderWidth = 4;
//        WeakSelf(weakSelf);
        UIImage *image = [UIImage imageNamed:@"userIcon"];
        self.userIcon.contentMode = UIViewContentModeScaleAspectFill;
        self.userIcon.image = image;
        userIcon.layer.cornerRadius = 40;
        userIcon.layer.masksToBounds = YES;
        
        [self addSubview:self.userIcon];
    }
    return _userIcon;
}
//城市
- (UILabel *)cityLabel
{
    if (!_cityLabel) {
        UILabel *city = [[UILabel alloc] init];
        city.text = @"Linda";
        [city setTextColor:kWhiteColor];
        city.font = kFont(14);
        city.textAlignment = NSTextAlignmentCenter;
        self.cityLabel = city;
        [self addSubview:self.cityLabel];
    }
    return _cityLabel;
}
//用户名
- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        UILabel *name = [[UILabel alloc] init];
        name.text = @"Linda";
        [name setTextColor:kWhiteColor];
        name.font = kFont(18);
        name.textAlignment = NSTextAlignmentCenter;
        self.nameLabel = name;
        [self addSubview:self.nameLabel];
    }
    return _nameLabel;
}

- (void)setupUsernameAndSign
{
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //封面背景
    _backgroundImage.frame = CGRectMake(0, 0, kScreenWidth, 200);
    //头像
    CGFloat iconW = 80;
    CGFloat iconH = 80;
    CGFloat iconX = self.width/2 - iconW/2;
    CGFloat iconY = self.backgroundImage.height / 2 - iconH / 2;
    self.userIcon.frame = CGRectMake(iconX, iconY, iconW, iconH);
    self.userIcon.layer.cornerRadius = self.userIcon.width / 2.0;
    
    //工具条
    self.userToolView.frame = CGRectMake(0, CGRectGetMaxY(self.backgroundImage.frame), kScreenWidth, 44);
    
//    CGSize size = CGSizeMake(80, 80);
//    self.whiteIcon.size = size;
//    self.whiteIcon.center = self.backgroundImage.center;
//
//    CGSize size1 = CGSizeMake(74, 74);
//    self.userIcon.size = size1;
//    NSLogRect(_userIcon.frame);
//    NSLogSize(_userIcon.size);
//    NSLogRect(self.backgroundImage.frame);
//    self.userIcon.center = self.backgroundImage.center;
    
   
    
    self.nameLabel.frame = CGRectMake(0, CGRectGetMaxY(self.userIcon.frame) + 10, kScreenWidth, 15);
    self.cityLabel.frame = CGRectMake(0, CGRectGetMaxY(self.nameLabel.frame) + 10, kScreenWidth, 15);
   
    
    
    
//    NSLogRect(self.backgroundImage);
//    NSLogRect(self.userToolView);
//    NSLogRect(self);
    
    
//    UIImage * oldImage = [UIImage imageNamed:@"userImage"];
//    
//    CGFloat boderW = 2;
//    CGFloat imageW = size1.width + 2 * boderW;
//    CGFloat imageH = size1.height + 2 * boderW;
//    CGSize imageSize = CGSizeMake(imageW, imageH);
//    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0.0);
//    
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    [[UIColor redColor] set];
//    CGFloat bigRadiusX = oldImage.size.width * 0.5;
//    CGFloat bigRadiusY = oldImage.size.height * 0.5;
//    CGFloat centerX = bigRadiusX;
//    CGFloat centerY = bigRadiusY;
//    
//    CGContextAddArc(ctx, centerX, centerY, 40, 0, M_PI * 2, 0);
//    CGContextFillPath(ctx);
//    
//    CGFloat smallRadius = 40 - boderW;
//    CGContextAddArc(ctx, centerX, centerY, smallRadius, 0, M_PI * 2, 0);
//    CGContextClip(ctx);
//    
//    [oldImage drawInRect:CGRectMake(boderW, boderW, 40, 40)];
//    
//
//    
//    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    
//    self.userIcon.image = newImage;
    
}

#pragma mark - CYUserToolViewDelegate
- (void)userToolView:(CYUserToolView *)tooView buttonType:(CYPersonalCenterHeaderItemType)buttonType
{
    if ([self.delegate respondsToSelector:@selector(userHeaderView:didClickItemWithType:)]) {
        [self.delegate userHeaderView:self didClickItemWithType:(CYPersonalCenterHeaderItemType)buttonType];
    }
}

@end
