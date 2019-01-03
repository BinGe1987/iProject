//
//  URLConstant.m
//  APP
//
//  Created by BinGe on 2019/1/3.
//

#import "URLConstant.h"

@implementation URLConstant

+ (NSString *)URLWithApi:(NSString *)api {
    return [NSString stringWithFormat:@"%@%@", BASE_URL, api];
}

@end
