//
//  Test.m
//  YDD
//
//  Created by BinGe on 2018/12/6.
//

#import "TestModule.h"
#import "MainNavigationController.h"
#import "TestViewController.h"

@implementation TestModule

- (void)setup:(BuildConfiguration)buildConfiguration {
    AppDelegate *app = (AppDelegate*)[UIApplication sharedApplication].delegate;
    app.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    app.window.backgroundColor = [UIColor whiteColor];
    UINavigationController *nv = [[MainNavigationController alloc] initWithRootViewController:[[TestViewController alloc] init]];
    app.window.rootViewController = nv;
    [app.window makeKeyAndVisible];
}

@end
