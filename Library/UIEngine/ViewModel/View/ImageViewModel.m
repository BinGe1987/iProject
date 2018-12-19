//
//  ImageViewModel.m
//  UIEngine
//
//  Created by BinGe on 2018/11/27.
//  Copyright © 2018 Bin. All rights reserved.
//

#import "ImageViewModel.h"
#import "ImageViewParams.h"

@interface ImageViewModel()

@property (nonatomic, strong) ImageView *imageView;

@end

@implementation ImageViewModel

- (void)initialize {
    self.imageView = (ImageView *)self.view;
    [self setImageViewParams:(ImageViewParams *)self.imageView.viewParams];
}

- (void)setImageViewParams:(ImageViewParams *)params {
    if ([params.imageSrc hasPrefix:@"@"]) {
        NSString *imageName = [params.imageSrc substringFromIndex:1];
        UIImage *image = [UIImage imageNamed:imageName];
        self.imageView.image = image;
    }
    else if ([params.imageSrc hasPrefix:@"http"]){
        [self.imageView setImageWithURL:[NSURL URLWithString:params.imageSrc]];
    }
    
    switch (params.scaleType) {
        default:
        case ImageScaleTypeCenter:
            self.imageView.contentMode = UIViewContentModeScaleAspectFit;
            break;
        case ImageScaleTypeFull:
            self.imageView.contentMode = UIViewContentModeScaleToFill;
            break;
    }
    
}

- (Class)ViewClass {
    return [ImageView class];
}
- (Class)ViewParamsClass {
    return [ImageViewParams class];
}

@end
