//
//  ImageUtils.m
//  APP
//
//  Created by BinGe on 2018/12/17.
//

#import "ImageUtils.h"

@implementation ImageUtils

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size 
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resultImage;
}

+ (UIImage *)imageWithColorHex:(NSString *)colorString size:(CGSize)size
{
    UIColor *color = [ColorUtils colorWithString:colorString];
    return [ImageUtils imageWithColor:color size:size];
}


@end
