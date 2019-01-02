//
//  ImageUtils.h
//  APP
//
//  Created by BinGe on 2018/12/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImageUtils : NSObject

///将UIColor变换为UIImage
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

///将16进制颜色（#ffffffff）转成UIImage
+ (UIImage *)imageWithColorHex:(NSString *)colorString size:(CGSize)size;

+ (UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize;

@end

NS_ASSUME_NONNULL_END
