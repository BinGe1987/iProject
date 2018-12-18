//
//  AppDelegate+Config.m
//  APP
//
//  Created by BinGe on 2018/12/18.
//

#import "AppDelegate+Config.h"

@implementation AppDelegate (Config)

- (void)configure {
    [self configureNetworkEnvironment];
    [self configurePushService];
}

///配置网络环境
- (void)configureNetworkEnvironment {
    NetConfig *config = [NetConfig new];
    config.baseUrl = @"www.baidu.com";
    [Net configure:config];
}

///配置推送服务
- (void)configurePushService {
    
}

@end
