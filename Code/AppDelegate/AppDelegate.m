//
//  AppDelegate.m
//  YDD
//
//  Created by BinGe on 2018/12/6.
//

#import "AppDelegate.h"

@interface AppDelegate()

@property (nonatomic, strong) AppModule *appModule;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.appModule = [AppModule new];
#ifdef TEST
    [[TestModule new] setup:BuildConfigurationWithTest];
#else
#ifdef DEBUG
    [self.appModule setup:BuildConfigurationWithDebug];
#else
    [self.appModule setup:BuildConfigurationWithRelease];
#endif
#endif
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application { }


- (void)applicationDidEnterBackground:(UIApplication *)application { }


- (void)applicationWillEnterForeground:(UIApplication *)application { }


- (void)applicationDidBecomeActive:(UIApplication *)application { }


- (void)applicationWillTerminate:(UIApplication *)application { }


@end
