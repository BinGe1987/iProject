//
//  ListData.m
//  APP
//
//  Created by BinGe on 2018/12/27.
//

#import "ListData.h"

@interface ListData()

@property (nonatomic, strong) NSMutableArray *array;

@end

@implementation ListData

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.array = [NSMutableArray new];
    }
    return self;
}

- (void)addData:(id)data {
    [self.array addObject:data];
}

- (NSArray *)list {
    return [self.array copy];
}

@end
