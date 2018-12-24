//
//  ColorUtils.m
//  APP
//
//  Created by BinGe on 2018/12/17.
//

#import "ColorUtils.h"

@implementation ColorUtils

+ (UIColor *)colorWithString:(NSString *)color {
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    if ([cString length] == 6) {
        cString = [NSString stringWithFormat:@"FF%@", cString];
    }
    if ([cString length] != 8) return [UIColor blackColor];
    NSRange range;
    range.length = 2;
    range.location = 0;
    NSString *aString = [cString substringWithRange:range];
    range.location = 2;
    NSString *rString = [cString substringWithRange:range];
    range.location = 4;
    NSString *gString = [cString substringWithRange:range];
    range.location = 6;
    NSString *bString = [cString substringWithRange:range];
    
    unsigned int a, r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    [[NSScanner scannerWithString:aString] scanHexInt:&a];
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:((float) a / 255.0f)];
}

@end
