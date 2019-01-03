//
//  Store.m
//  APP
//
//  Created by BinGe on 2018/12/19.
//

#import "Store.h"

@implementation Store

+ (void)setValue:(id)value forKey:(NSString *)key {
    NSUserDefaults *local = [NSUserDefaults standardUserDefaults];
    [local setObject:value forKey:key];
}

+ (id)valueForKey:(NSString *)key {
    return [self valueForKey:key defaultValue:nil];
}

+ (id)valueForKey:(NSString *)key defaultValue:(_Nullable id)value {
    NSUserDefaults *local = [NSUserDefaults standardUserDefaults];
    NSString *obj = [local objectForKey:key];
    return obj ? obj : value;
}

@end
