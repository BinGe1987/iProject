//
//  ConfigData.m
//  APP
//
//  Created by BinGe on 2018/12/21.
//

#import "ConfigData.h"

@implementation ConfigData

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tabArray = [NSMutableArray new];
    }
    return self;
}

- (void)setData:(Data *)data {
    [super setData:data];
//    NSInteger status = [data integerWithKey:@"status"];
    NSArray *array = [data arrayWithKey:@"list"];
    for (Data *subData in array) {
        [self.tabArray addObject:[TabData withData:subData]];
    }
}

@end
