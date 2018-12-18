//
//  Module.m
//  YDD
//
//  Created by BinGe on 2018/12/6.
//

#import "Module.h"

#import "MainNavController.h"
#import "MainTabbarController.h"
#import "LoginViewController.h"
#import "ViewController.h"

@implementation Module

+ (void)launch {
    AppDelegate *app = (AppDelegate*)[UIApplication sharedApplication].delegate;
    app.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    app.window.backgroundColor = [UIColor whiteColor];
    
    MainTabbarController *nv = [[MainTabbarController alloc] init];
    app.window.rootViewController = nv;
    [app.window makeKeyAndVisible];
}

+ (void)checkLogin:(void (^)(BOOL isLogin))finish {
    [[DataCenter get] perform:Operation_Login_check params:nil callback:^(id  _Nonnull operation, id  _Nullable data) {
        BOOL isLogin = [[DataCenter get] getUserData].isLogin;
        if (!isLogin) {
//            [Module startLoginAnimated:YES];
        }
        finish(isLogin);
    }];
}

+ (void)startLoginAnimated:(BOOL)flag {
    UIViewController *vc = [UIViewController topViewController];
    [vc.navigationController pushViewController:[[LoginViewController alloc] init] animated:YES];
}

@end
