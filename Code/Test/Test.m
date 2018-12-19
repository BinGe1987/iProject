//
//  Test.m
//  YDD
//
//  Created by BinGe on 2018/12/6.
//

#import "Test.h"
#import "MainNavController.h"
#import "TestViewController.h"

@implementation Test

+ (void)test {
    AppDelegate *app = (AppDelegate*)[UIApplication sharedApplication].delegate;
    app.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    app.window.backgroundColor = [UIColor whiteColor];
    UINavigationController *nv = [[MainNavController alloc] initWithRootViewController:[[TestViewController alloc] init]];
    app.window.rootViewController = nv;
    [app.window makeKeyAndVisible];
}

@end
