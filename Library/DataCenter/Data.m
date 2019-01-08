//
//  Data.m
//  YDD
//
//  Created by BinGe on 2018/12/4.
//

#import "Data.h"

@implementation Data

+ (instancetype)withDictionary:(NSDictionary *)dict {
    return [[self class] withData:[Data JSONWithDictionary:dict]];
}

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

- (id)dataWithKey:(NSString *)key {
    return [Data JSONWithDictionary:[self.source objectForKey:key]];
}

-(id)copyWithZone:(NSZone *)zone {
    Data *newClass = [[[self class] alloc] init];
    [newClass setData:self];
    return newClass;
}

@end
