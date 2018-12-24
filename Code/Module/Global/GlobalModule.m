//
//  GlobalModule.m
//  APP
//
//  Created by BinGe on 2018/12/24.
//

#import "GlobalModule.h"

@implementation GlobalModule

- (void)setup:(BuildConfiguration)buildConfiguration {
    [IQKeyboardManager sharedManager].enable = YES;
    
    NetConfig *config = [NetConfig new];
    config.baseUrl = @"www.baidu.com";
    [Net configure:config];
}

@end
