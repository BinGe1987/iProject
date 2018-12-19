//
//  ImageViewParams.h
//  APP
//
//  Created by BinGe on 2018/12/10.
//

#import "ViewParams.h"

typedef enum : NSUInteger{
    ImageScaleTypeCenter,
    ImageScaleTypeFull,
} ImageScaleType;

NS_ASSUME_NONNULL_BEGIN

@interface ImageViewParams : ViewParams

@property (nonatomic, assign) ImageScaleType scaleType;
@property (nonatomic, strong) NSString      *imageSrc;

@end

NS_ASSUME_NONNULL_END
