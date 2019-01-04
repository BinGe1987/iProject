//
//  UIView+Params.m
//  APP
//
//  Created by BinGe on 2018/12/12.
//

#import "UIView+Params.h"

@implementation UIView (Params)

static const void *viewParamsKey = &viewParamsKey;
static const void *layoutParamsKey = &layoutParamsKey;
static const void *maxWidthKey = &maxWidthKey;
static const void *maxHeightKey = &maxHeightKey;

static char widthKey;
static char heightKey;

- (instancetype)initWithViewParams:(ViewParams *)viewParams {
    self = [self init];
    self.viewParams = viewParams;
    return self;
}

- (void)setWidth:(CGFloat)width {
    objc_setAssociatedObject(self, &widthKey, @(width), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(CGFloat)width {
    return [objc_getAssociatedObject(self, &widthKey) floatValue];
}
- (void)setHeight:(CGFloat)height {
    objc_setAssociatedObject(self, &heightKey, @(height), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(CGFloat)height {
    return [objc_getAssociatedObject(self, &heightKey) floatValue];
}

- (void)setMaxWidth:(CGFloat)width {
    objc_setAssociatedObject(self, &maxWidthKey, @(width), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(CGFloat)maxWidth {
    return [objc_getAssociatedObject(self, &maxWidthKey) floatValue];
}
- (void)setMaxHeight:(CGFloat)height {
    objc_setAssociatedObject(self, &maxHeightKey, @(height), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(CGFloat)maxHeight {
    return [objc_getAssociatedObject(self, &maxHeightKey) floatValue];
}

- (void)setViewParams:(ViewParams *)params {
    objc_setAssociatedObject(self, viewParamsKey, params, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (ViewParams *)viewParams {
    return objc_getAssociatedObject(self, viewParamsKey);
}

- (void)setLayoutParams:(LayoutParams *)params {
    objc_setAssociatedObject(self, layoutParamsKey, params, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (LayoutParams *)layoutParams {
    return objc_getAssociatedObject(self, layoutParamsKey);
}

- (void)setVisibility:(ViewVisibility)visibility {
    self.viewParams.visibility = visibility;
    switch (visibility) {
        case ViewVisibilityVisible:
            self.hidden = NO;
            break;
        case ViewVisibilityInvisible:
            self.hidden = YES;
            break;
        case ViewVisibilityGone:
            
            break;
        default:
            break;
    }
}

@end
