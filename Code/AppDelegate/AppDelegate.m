//
//  AppDelegate.m
//  YDD
//
//  Created by BinGe on 2018/12/6.
//

#import "AppDelegate.h"
#import "AppDelegate+Config.h"


@interface AppDelegate ()

@end

@implementation AppDelegate

#pragma mark 调试模式
///调试模式启动
- (void)schemeDebugDidFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //配置基本设置+第三方库
    [AppDelegate configure];
    //启动module
//    [Module launch];
}

#pragma mark 测试模式
///测试模式启动
- (void)schemeTestDidFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [Test test];
}

#pragma mark 系统方法
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
#ifdef TEST
    [self schemeTestDidFinishLaunchingWithOptions:launchOptions];
#else
    [self schemeDebugDidFinishLaunchingWithOptions:launchOptions];
#endif
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application { }


- (void)applicationDidEnterBackground:(UIApplication *)application { }


- (void)applicationWillEnterForeground:(UIApplication *)application { }


- (void)applicationDidBecomeActive:(UIApplication *)application { }


- (void)applicationWillTerminate:(UIApplication *)application { }


@end
