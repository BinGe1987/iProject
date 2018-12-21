//
//  Module.m
//  YDD
//
//  Created by BinGe on 2018/12/6.
//

#import "Module.h"
#import "LaunchModule.h"

@implementation Module

+ (void)launch {
    //LaunModule在start之后会一起停留在启动页，直接收到App启动完成才会显示关闭启动页。
    [LaunchModule start];
    
    //Module配置
    [Module configure];
    
    //从服务器获取Module配置
    [Module getConfigurationFromServer];
}

+ (void)configure {
    NetConfig *config = [NetConfig new];
    config.baseUrl = @"www.baidu.com";
    [Net configure:config];
}

+ (void)getConfigurationFromServer {
    [DataCenter perform:Operation_GetConfig params:nil callback:^(id  _Nonnull operation, id  _Nullable data) {
        [EventBus postEvent:EventAppLaunchCompleted];
    }];
}

@end
