//
//  DataHandler.m
//  YDD
//
//  Created by BinGe on 2018/12/4.
//

#import "DataHandler.h"

@interface DataHandler()

/**
 * 操作对应的处理器的集合
 */
@property (nonatomic, strong) NSMutableDictionary *performers;

/**
 * 原始数据对应的处理器集合
 */
@property (nonatomic, strong) NSMutableDictionary *parsers;

@end

@implementation DataHandler

- (instancetype)init
{
    self = [super init];
    if (self) {
        if (![self conformsToProtocol: @protocol(HandlerDelegate)]) {
            Log(@"DataHandler子类必须实现HandlerDelegate协议。");
            [self doesNotRecognizeSelector:_cmd];
            return nil;
        }
        self.performers = [[NSMutableDictionary alloc] init];
        self.parsers = [[NSMutableDictionary alloc] init];
        self.delegate = (id<HandlerDelegate>)self;
    }
    return self;
}

#pragma -mark IPerformer 判断、获取、绑定
- (BOOL)isContainsPerformer:(id)operation {
    return [self getPerformer:operation];
}

- (id<IPerformer>)getPerformer:(id)operation {
    NSString *key = [NSString stringWithFormat:@"%@",operation];
    return [self.performers objectForKey:key];
}

- (BOOL)bindOperation:(id)operation withPerformer:(id<IPerformer>)performer {
    NSString *key = [NSString stringWithFormat:@"%@",operation];
    [self.performers setObject:performer forKey:key];
    return YES;
}

#pragma -mark IParser 判断、绑定、处理
- (BOOL)isContainsParser:(id)operation {
    NSString *key = [NSString stringWithFormat:@"%@",operation];
    return [self.parsers objectForKey:key];
}

- (BOOL)bindParser:(id)operation withParser:(id<IParser>)parser {
    NSString *key = [NSString stringWithFormat:@"%@",operation];
    [self.parsers setObject:parser forKey:key];
    return YES;
}

- (id)parseData:(id)operation withSourceData:(id)source {
    NSString *key = [NSString stringWithFormat:@"%@",operation];
    id<IParser> parser = [self.parsers objectForKey:operation];
    return [parser parse:key withSource:source];
}

- (void)bind:(id)operation performer:(_Nullable id<IPerformer>)performer parser:(_Nullable id<IParser>)parser {
    NSString *key = [NSString stringWithFormat:@"%@",operation];
    if (performer) {
        [self.performers setObject:performer forKey:key];
    }
    if (parser) {
        [self.parsers setObject:parser forKey:key];
    }
    
}

@end
