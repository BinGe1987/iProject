//
//  Store.h
//  APP
//
//  Created by BinGe on 2018/12/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Store : NSObject

+ (void)setValue:(id)value forKey:(NSString *)key;

+ (id)valueForKey:(NSString *)key;

+ (id)valueForKey:(NSString *)key defaultValue:(_Nullable id)value;

@end

NS_ASSUME_NONNULL_END
