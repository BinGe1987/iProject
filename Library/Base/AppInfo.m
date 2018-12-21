//
//  AppInfo.m
//  APP
//
//  Created by BinGe on 2018/12/22.
//

#import "AppInfo.h"
#import "sys/utsname.h"

@implementation AppInfo

+ (NSString *)DisplayName {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];
}

+ (NSString *)BundleIdentifier {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
}

+ (NSString *)Version {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

+ (NSString *)Build {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
}

+ (NSString *)Device {
    return [UIDevice currentDevice].name;
}

+ (NSString *)SystemVersion {
    return [UIDevice currentDevice].systemVersion;
}

+ (NSString *)UUID {
    return [[UIDevice currentDevice] identifierForVendor].UUIDString;
}

@end
