//
//  AppInfo.h
//  APP
//
//  Created by BinGe on 2018/12/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AppInfo : NSObject

+ (NSString *)DisplayName;

+ (NSString *)BundleIdentifier;

+ (NSString *)Version;

+ (NSString *)Build;

+ (NSString *)Device;

+ (NSString *)SystemVersion;

+ (NSString *)UUID;



@end

NS_ASSUME_NONNULL_END
