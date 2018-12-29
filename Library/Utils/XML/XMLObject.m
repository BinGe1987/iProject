//
//  XMLObject.m
//  APP
//
//  Created by BinGe on 2018/12/29.
//

#import "XMLObject.h"

@implementation XMLObject

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.childs = [NSMutableArray new];
    }
    return self;
}

- (NSString *)description {
    return self.name;
}

@end
