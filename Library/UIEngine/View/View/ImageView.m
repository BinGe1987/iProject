//
//  ImageView.m
//  UIEngine
//
//  Created by BinGe on 2018/11/29.
//  Copyright © 2018 Bin. All rights reserved.
//

#import "ImageView.h"

@implementation ImageView

- (void)setImageWithURL:(NSURL *)imageURL {
    [super setImageWithURL:imageURL];
}

- (CGSize)boundingSizeNeed {
    CGFloat width = 99;
    CGFloat height = 99;
    if (self.image) {
        width = self.image.size.width + self.viewParams.paddingLeft + self.viewParams.paddingRight;
        height = self.image.size.height + self.viewParams.paddingTop + self.viewParams.paddingBottom;
    }
    return CGSizeMake(width, height);
}
    

@end
