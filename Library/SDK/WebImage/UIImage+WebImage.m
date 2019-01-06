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
//    YYWebImageManager *manager = [YYWebImageManager sharedManager];
//    UIImage *image = []
//    manager.cache setImage:<#(nullable UIImage *)#> imageData:<#(nullable NSData *)#> forKey:<#(nonnull NSString *)#> withType:<#(YYImageCacheType)#>
    YYImage *image = [YYImage imageWithData: [NSData dataWithContentsOfURL:url]];
    return image;
}

+ (UIImage *)imageWithURL:(NSURL *)url {
    __strong UIImage *img = [[YYWebImageManager sharedManager].cache getImageForKey:[url absoluteString]];
    if (img) {
        return img;
    }
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0); //创建信号量
    [[YYWebImageManager sharedManager] requestImageWithURL:url options:YYWebImageOptionAvoidSetImage progress:nil transform:nil completion:^(UIImage * _Nullable image, NSURL * _Nonnull url, YYWebImageFromType from, YYWebImageStage stage, NSError * _Nullable error) {
        if (stage == YYWebImageStageFinished && !error) {
            [[YYWebImageManager sharedManager].cache setImage:image imageData:nil forKey:[url absoluteString] withType:YYImageCacheTypeAll];
        }
        dispatch_semaphore_signal(semaphore);//发送信号
    }];
    dispatch_semaphore_wait(semaphore,DISPATCH_TIME_FOREVER);  //等待
    img = [[YYWebImageManager sharedManager].cache getImageForKey:[url absoluteString]];
    return img;
}

@end
