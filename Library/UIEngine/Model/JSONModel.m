//
//  JSONModel.m
//  UIEngine
//
//  Created by BinGe on 2018/11/27.
//  Copyright © 2018 Bin. All rights reserved.
//

#import "JSONModel.h"

@interface JSONModel()

@property (nonatomic, strong) NSDictionary *source;

@end

@implementation JSONModel

-(instancetype)initWithJSON:(NSDictionary *)json {
    self = [super init];
    if (self) {
        self.source = json;
    }
    return self;
}

-(instancetype)initWithJSONFileName:(NSString *)name; {
    self = [super init];
    if (self) {
        if ([name hasPrefix:@"@"]) {
            name = [name substringFromIndex:1];
        }
        NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:nil];
        JSON *json = [[JSON alloc] initWithPath:path];
        self.source = json.source;
    }
    return self;
}

- (id)getSource {
    return self.source;
}

- (NSString *)getType {
    return [self getString:@"view_type" defaultValue:nil];
}

- (NSString *)getString:(NSString *)key defaultValue:(NSString * _Nullable)defValue; {
    NSString *value = defValue;
    if (self.source) {
        value = [self.source objectForKey:key];
    }
    if (!value) {
        value = defValue;
    }
    return value;
}

- (int)getInteger:(NSString *)key defaultValue:(int)defValue {
    NSString *value = [self getString:key defaultValue:[NSString stringWithFormat:@"%d", defValue]];
    return [value intValue];
}

- (CGFloat)getFloat:(NSString *)key defaultValue:(CGFloat)defValue {
    NSString *value = [self getString:key defaultValue:[NSString stringWithFormat:@"%fl", defValue]];
    return [value floatValue];
}

- (NSArray *)getChildModels {
    NSMutableArray *newArray = [[NSMutableArray alloc] init];
    NSArray *array = [self.source objectForKey:@"subviews"];
    for (NSDictionary *json in array) {
        JSONModel *model = [[JSONModel alloc] initWithJSON:json];
        NSString *include = [model getString:@"include" defaultValue:nil];
        if (include) {
            model = [[JSONModel alloc] initWithJSONFileName:include];
        }
        [newArray addObject:model];
    }
    return newArray;
}

@end
