//
//  JSON.m
//  
//
//  Created by BinGe on 2018/12/4.
//  Copyright © 2018. All rights reserved.
//

#import "JSON.h"

@implementation JSON

+ (instancetype)JSONWithDictionary:(NSDictionary *)dictionary {
    Class cls = [self class];
    JSON *obj = [[cls alloc] init];;
    obj.source = dictionary;
    return obj;
}

- (instancetype)initWithPath:(NSString *)path {
    self = [super init];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSError *error;
    id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    if (error) {
        Log(@"%@", error);
        self.error = error;
    } else {
        self.source = json;
    }
    return self;
}


- (NSString *)stringWithKey:(NSString *)key {
    return [self stringWithKey:key defaultValue:nil];
}

- (NSString *)stringWithKey:(NSString *)key defaultValue:(NSString * _Nullable)defaultValue {
    return [self.source objectForKey:key];
}

- (NSInteger)integerWithKey:(NSString *)key {
    return [self integerWithKey:key defaultValue:0];
}

- (NSInteger)integerWithKey:(NSString *)key defaultValue:(NSInteger)defaultValue {
    return [[self.source objectForKey:key] integerValue];
}

- (NSArray *)arrayWithKey:(NSString *)key {
    NSMutableArray *newArray = [NSMutableArray new];
    NSArray *array = [self.source objectForKey:key];
    for (NSDictionary *dic in array) {
        [newArray addObject:[JSON JSONWithDictionary:dic]];
    }
    return newArray;
}

- (id)jsonWithKey:(NSString *)key {
    return [JSON JSONWithDictionary:[self.source objectForKey:key]];
}

@end
