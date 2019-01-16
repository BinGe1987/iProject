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

NSString * const SIMULATOR = @"Simulator";
+ (BOOL)isSimulator {
    return [AppInfo DeviceString] == SIMULATOR;
}

+ (NSString *)DeviceString {
    static NSString *deviceString;
    if (!deviceString) {
        struct utsname systemInfo;
        uname(&systemInfo);
        deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
        if ([deviceString isEqualToString:@"i386"])         deviceString =  SIMULATOR;
        if ([deviceString isEqualToString:@"x86_64"])       deviceString =  SIMULATOR;
    }
    return deviceString;
}

@end
