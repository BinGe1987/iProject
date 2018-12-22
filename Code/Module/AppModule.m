//
//  AppModule.m
//  APP
//
//  Created by BinGe on 2018/12/22.
//

#import "AppModule.h"
#import "LaunchModule.h"

@implementation AppModule

+ (void)setup {
    //LaunModule在start之后会一起停留在启动页，直接收到App启动完成才会显示关闭启动页。
    [LaunchModule start];
}

+ (void)configure {
    NetConfig *config = [NetConfig new];
    config.baseUrl = @"www.baidu.com";
    [Net configure:config];
}

+ (void)getConfigurationFromServer {
    [DataCenter perform:OperationGetConfig params:nil callback:^(id  _Nonnull operation, id  _Nullable data) {
        [EventBus postEvent:EventAppLaunchCompleted];
    }];
}

@end
