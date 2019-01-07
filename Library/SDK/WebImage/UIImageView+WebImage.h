//
//  UIImageView+WebImage.h
//  
//
//  Created by BinGe on 2018/12/6.
//

#import "UIImage+WebImage.h"

NS_ASSUME_NONNULL_BEGIN

/**
 这个扩展的意义在于，项目中使用此类提供的方法来加载网络图片，
 那么后期不管此类使用的是哪个WebImage框架，对项目中的代码不会有任何影响
 */
@interface UIImageView (WebImage)

- (void)setImageWithURL:(NSURL *)imageURL;

- (void)setImageWithURL:(NSURL *)imageURL placeholder:(UIImage *)placeholder;

@end

NS_ASSUME_NONNULL_END
