//
//  UIImageView+WebImage.m
//  
//
//  Created by BinGe on 2018/12/6.
//

#import "UIImageView+WebImage.h"
#import "YYWebImage.h"

@implementation UIImageView (WebImage)

- (void)setImageWithURL:(NSURL *)imageURL {
    self.yy_imageURL = imageURL;
}

//- (void)test {
//    YYImageCache *cache = [YYWebImageManager sharedManager].cache;
//    cache.
//}

@end
