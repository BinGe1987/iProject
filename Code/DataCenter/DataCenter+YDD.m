//
//  DataCenter+YDD.m
//  APP
//
//  Created by BinGe on 2018/12/10.
//

#import "DataCenter+YDD.h"

@implementation DataCenter (YDD)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"
- (NSArray *)getDataHandlerClassForInit {
    return @[
             [LoginHandler class],
             [ConfigHandler class],
             [UserHandler class],
             [HomeHandler class],
             [DiscoverHandler class],
             ];
}
#pragma clang diagnostic pop

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

@end
