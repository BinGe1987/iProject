//
//  ImageViewParams.m
//  APP
//
//  Created by BinGe on 2018/12/10.
//

#import "ImageViewParams.h"

@implementation ImageViewParams

-(instancetype)initWithModel:(id<UIModel>)model {
    self = [super initWithModel:model];
    if (self) {
        self.imageSrc = [model getString:@"image_src" defaultValue:@"@AppIcon"];
    }
    return self;
}

@end
