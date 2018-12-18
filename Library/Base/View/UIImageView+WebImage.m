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
    Log(@"set image url.");
    self.yy_imageURL = imageURL;
}

@end
