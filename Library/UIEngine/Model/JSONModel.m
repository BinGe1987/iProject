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

- (id)getSource {
    return self.source;
}

- (NSString *)getType {
    return [self getString:@"view_type" defaultValue:@"text"];
}

- (NSString *)getString:(NSString *)key defaultValue:(NSString *)defValue {
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
    NSString *value = [self getString:key defaultValue:@"0"];
    return [value intValue];
}

- (NSArray *)getChildModels {
    NSMutableArray *newArray = [[NSMutableArray alloc] init];
    NSArray *array = [self.source objectForKey:@"subviews"];
    for (NSDictionary *json in array) {
        JSONModel *model = [[JSONModel alloc] initWithJSON:json];
        [newArray addObject:model];
    }
    return newArray;
}

@end
