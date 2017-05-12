//
//  LoginViewController.m
//  ChaoYue
//
//  Created by again on 2017/5/8.
//  Copyright © 2017年 again. All rights reserved.
//

#import "LoginViewController.h"
#import <ShareSDK/ShareSDK.h>

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.loginBtn.backgroundColor = kNormalColor;
    [self.loginBtn setTitle:@"Dfae" forState:UIControlStateNormal];
    
    //    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 200, 200)];
//    btn.backgroundColor = kNormalColor;
//    self.btn = btn;
//    [btn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btn];
}

- (void)login{
    
    
    [ShareSDK getUserInfo:SSDKPlatformTypeSinaWeibo onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
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
}

@end
