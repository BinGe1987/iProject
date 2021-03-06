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
        self.imageSrc = [model getString:@"image_src" defaultValue:nil];
        self.imageUrl = [model getString:@"image_url" defaultValue:nil];
        
        NSString *type = [model getString:@"image_scaleType" defaultValue:@"center"];
        if ([type isEqualToString:@"full"]) {
            self.scaleType = ImageScaleTypeFull;
        } else {
            self.scaleType = ImageScaleTypeCenter;
        }
    }
    return self;
}

@end
