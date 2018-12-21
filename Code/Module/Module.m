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
    [Module configure];
    [LaunchModule start];
}

+ (void)configure {
    NetConfig *config = [NetConfig new];
    config.baseUrl = @"www.baidu.com";
    [Net configure:config];
}

+ (void)getConfigurationFromServer {
    [DataCenter perform:Operation_GetConfig params:nil callback:^(id  _Nonnull operation, id  _Nullable data) {
        Log(@"");
    }];
}

//+ (void)startLoginAnimated:(BOOL)flag {
//    UIViewController *vc = [UIViewController topViewController];
//    [vc.navigationController pushViewController:[[LoginViewController alloc] init] animated:YES];
//}

@end
