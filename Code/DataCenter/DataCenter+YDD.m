//
//  DataCenter+YDD.m
//  APP
//
//  Created by BinGe on 2018/12/10.
//

#import "DataCenter+YDD.h"

@implementation DataCenter (YDD)

- (ConfigData *)configData {
    return (ConfigData *)[self getData: [ConfigHandler class]];
}

- (UserData *)userData {
    return (UserData *)[self getData: [UserHandler class]];
}

- (HomeData *)homeData {
    return (HomeData *)[self getData: [HomeHandler class]];
}

- (DiscoverData *)discoverData {
    return (DiscoverData *)[self getData: [DiscoverHandler class]];
}

+ (NSString *)token {
    NSString *token = [DataCenter get].userData.token;
//    if ([NSString isEmpty:token]) {
//        token = [Store valueForKey:@"token"];
//    }
    return [NSString isEmpty:token] ? @"" : token;
}

@end
