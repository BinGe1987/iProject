//
//  UIImage+WebImage.m
//  APP
//
//  Created by BinGe on 2018/12/24.
//

#import "UIImage+WebImage.h"
#import "YYWebImage.h"

@implementation UIImage (WebImage)

+ (UIImage *)imageURL:(NSURL *)url {
    YYWebImageManager *manager = [YYWebImageManager sharedManager];
//    UIImage *image = []
//    manager.cache setImage:<#(nullable UIImage *)#> imageData:<#(nullable NSData *)#> forKey:<#(nonnull NSString *)#> withType:<#(YYImageCacheType)#>
    YYImage *image = [YYImage imageWithData: [NSData dataWithContentsOfURL:url]];
    return image;
}

@end
