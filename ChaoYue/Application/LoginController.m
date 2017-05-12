//
//  LoginController.m
//  ChaoYue
//
//  Created by again on 2017/5/12.
//  Copyright © 2017年 again. All rights reserved.
//

#import "LoginController.h"
#import <ShareSDK/ShareSDK.h>

@interface LoginController ()

@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    //    self.weixinLoginBtn.clipsToBounds = YES;
    self.weixinLoginBtn.layer.cornerRadius = 20;
    self.weixinLoginBtn.layer.masksToBounds = YES;
    
    self.weiboLoginBtn.layer.cornerRadius = 20;
    self.weiboLoginBtn.layer.masksToBounds = YES;
    
    self.qqLoginBtn.layer.cornerRadius = 20;
    self.qqLoginBtn.layer.masksToBounds = YES;
    
    [self.weiboLoginBtn addTarget:self action:@selector(loginbtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.weixinLoginBtn addTarget:self action:@selector(loginbtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.qqLoginBtn addTarget:self action:@selector(loginbtn:) forControlEvents:UIControlEventTouchUpInside];

    for (int i = 0; i < self.view.subviews.count; i++) {
        UIControl *btn = self.view.subviews[i];
        btn.tag = i;
    }
}

- (void)loginbtn:(UIButton *)btn
{
    SSDKPlatformType type;
    NSLog(@"%ld", btn.tag);
    if (btn.tag == 1) {
        type = SSDKPlatformTypeWechat;
    } else if(btn.tag == 2){
        type = SSDKPlatformTypeSinaWeibo;
    } else if (btn.tag == 3){
        type = SSDKPlatformTypeQQ;
    } else if (btn.tag == 4){
        type = SSDKPlatformTypeSMS;
    } else {
        return;
    }
    
    [ShareSDK getUserInfo:type onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
    if (state == SSDKResponseStateSuccess) {
        NSLog(@"uid=%@",user.uid);
        NSLog(@"%@",user.credential);
        NSLog(@"token=%@",user.credential.token);
        NSLog(@"nickname=%@",user.nickname);
    }
    
    else
    {
        NSLog(@"%@----",error);
    }
}];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
