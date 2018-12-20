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
    
    //本地图片
    if (params.imageSrc) {
        UIImage *image = [UIImage imageNamed:params.imageSrc];
        self.imageView.image = image;
    }
    //网络图片
    else if (params.imageUrl){
        [self.imageView setImageWithURL:[NSURL URLWithString:params.imageUrl]];
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
