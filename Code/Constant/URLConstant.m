//
//  URLConstant.m
//  APP
//
//  Created by BinGe on 2019/1/3.
//

#import "URLConstant.h"

@implementation URLConstant

+ (NSString *)host {
    if (AppInfo.isSimulator) {
        return BASE_URL_IN;
    }
    return BASE_URL_OUT;
}

+ (NSString *)URLWithApi:(NSString *)api {
    return [NSString stringWithFormat:@"%@%@", [URLConstant host], api];
}

@end
