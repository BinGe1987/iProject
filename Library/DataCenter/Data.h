//
//  Data.h
//  YDD
//
//  Created by BinGe on 2018/12/4.
//

#import "JSON.h"

NS_ASSUME_NONNULL_BEGIN

@interface Data : JSON

+ (instancetype)withDictionary:(NSDictionary *)dict;

+ (instancetype)withData:(Data *)data;

- (instancetype)initWithData:(Data *)data;

- (id)dataWithKey:(NSString *)key;

- (void)initialize;

- (void)setData:(Data *)data NS_REQUIRES_SUPER;

@end

NS_ASSUME_NONNULL_END
