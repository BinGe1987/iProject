//
//  MainModule.m
//  APP
//
//  Created by BinGe on 2018/12/21.
//

#import "MainModule.h"
#import "MainTabbarController.h"

@implementation MainModule

- (void)setup:(BuildConfiguration)buildConfiguration {
    AppDelegate *app = (AppDelegate*)[UIApplication sharedApplication].delegate;
    app.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    app.window.backgroundColor = [UIColor whiteColor];
    MainTabbarController *nv = [[MainTabbarController alloc] init];
    app.window.rootViewController = nv;
    [app.window makeKeyAndVisible];
}

- (void)getConfigurationFromServer {
    //LaunModule在setup之后会一起停留在启动页，直接收到App启动完成才会显示关闭启动页。
    [DataCenter perform:OperationGetConfig params:nil callback:^(id  _Nonnull operation, id  _Nullable data) {
        [self getConfigurationCompleted:data];
    }];
}

- (void)getConfigurationCompleted:(ConfigData *)config {
    AppDelegate *app = (AppDelegate*)[UIApplication sharedApplication].delegate;
    MainTabbarController *main = (MainTabbarController *)app.window.rootViewController;
    
}


@end
