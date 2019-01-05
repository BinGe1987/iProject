//
//  URLConstant.m
//  APP
//
//  Created by BinGe on 2019/1/3.
//

#import "URLConstant.h"

@implementation URLConstant

+ (NSString *)host {
    return BASE_URL;
}

+ (NSString *)URLWithApi:(NSString *)api {
    return [NSString stringWithFormat:@"%@%@", BASE_URL, api];
}

@end
