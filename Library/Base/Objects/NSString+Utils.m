//
//  NSObject+Utils.m
//  APP
//
//  Created by BinGe on 2018/12/25.
//

#import "NSString+Utils.h"

@implementation NSString (Utils)

+ (BOOL)isEmpty:(NSString *)string {
    return (!string) || ([string isEqualToString:@""]);
}

@end
