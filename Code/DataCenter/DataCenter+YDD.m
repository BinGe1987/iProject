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

@end
