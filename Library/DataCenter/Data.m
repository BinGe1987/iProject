//
//  Data.m
//  YDD
//
//  Created by BinGe on 2018/12/4.
//

#import "Data.h"

@implementation Data

+ (instancetype)withData:(Data *)data {
    return [[self alloc] initWithData:data];
}

- (instancetype)initWithData:(Data *)data {
    self = [self init];
    [self setData:data];
    return self;
}

- (instancetype)init {
    self = [super init];
    [self initialize];
    return self;
}

- (void)initialize {
    
}

- (void)setData:(Data *)data {
    self.source = data.source;
    self.error = data.error;
}

- (NSArray *)arrayWithKey:(NSString *)key {
    NSMutableArray *newArray = [NSMutableArray new];
    NSArray *array = [self.source objectForKey:key];
    for (NSDictionary *dic in array) {
        [newArray addObject:[Data JSONWithDictionary:dic]];
    }
    return newArray;
}

- (id)jsonWithKey:(NSString *)key {
    return [Data JSONWithDictionary:[self.source objectForKey:key]];
}


@end
