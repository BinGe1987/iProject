//
//  JSON.h
//  YDD
//
//  Created by BinGe on 2018/12/4.
//  Copyright © 2018 约多多. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JSON : NSObject

///错误信息
@property (nonatomic, strong) NSError *error;

@property (nonatomic, strong) NSDictionary *source;

+ (instancetype)JSONWithDictionary:(NSDictionary *)dictionary;

- (instancetype)initWithPath:(NSString *)path;

- (NSString *)stringWithKey:(NSString *)key;
- (NSString *)stringWithKey:(NSString *)key defaultValue:(NSString * _Nullable)defaultValue;

- (NSInteger)integerWithKey:(NSString *)key;
- (NSInteger)integerWithKey:(NSString *)key defaultValue:(NSInteger)defaultValue;

- (CGFloat)floatWithKey:(NSString *)key;
- (CGFloat)floatWithKey:(NSString *)key defaultValue:(CGFloat)defaultValue;


- (NSArray *)arrayWithKey:(NSString *)key;

- (id)jsonWithKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
