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

+ (UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize {
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(image.size.width * scaleSize, image.size.height * scaleSize), NO, 0);
    [image drawInRect:CGRectIntegral(CGRectMake(0, 0, image.size.width * scaleSize, image.size.height * scaleSize))];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return [scaledImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}


+ (UIImage *)zipImage:(UIImage *)image toFileSize:(CGFloat)fileSize {
    UIImage *target = image;
    for (int i = 0; i < 10; i++) {
        CGFloat compressionQuality = 1.0 - i / 10.0;
        NSData *data = UIImageJPEGRepresentation(image, compressionQuality);
        CGFloat kb = [data length] / 1024.0;
        target = [UIImage imageWithData:data];
        if (kb < fileSize) {
            return target;
        }
    }
    return target;
}

@end
