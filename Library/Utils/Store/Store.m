//
//  Store.m
//  APP
//
//  Created by BinGe on 2018/12/19.
//

#import "Store.h"

@implementation Store

+ (void)setValue:(id)value forKey:(NSString *)key {
    
}

+ (id)valueForKey:(NSString *)key {
    return [self valueForKey:key defaultValue:nil];
}

+ (id)valueForKey:(NSString *)key defaultValue:(_Nullable id)value {
    id obj = nil;
    return obj ? obj : value;
}

@end
