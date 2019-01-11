//
//  UIView+View.m
//  UIEngine
//
//  Created by BinGe on 2018/11/28.
//  Copyright © 2018 Bin. All rights reserved.
//

#import "UIView+View.h"

@implementation UIView (View)

static char shapeLayerKey;



- (id)findViewByName:(NSString *)name {
    return [self findViewByName:name withSuperView:self];
}

- (UIView *)findViewByName:(NSString *)name withSuperView:(UIView *)superView {
    if ([NSString isEmpty:name]) return nil;
    if (superView.viewParams &&  [superView.viewParams.name isEqualToString:name]) {
        return superView;
    }
    for (UIView *view in superView.subviews) {
        if (![view isKindOfClass:[UITableView class]]) {
            UIView *realView = [self findViewByName:name withSuperView:view];
            if (realView) {
                return realView;
            }
        } else {
            if (view.viewParams &&  [view.viewParams.name isEqualToString:name]) {
                return view;
            }
        }
    }
    return nil;
}

- (UIView *)getRootView {
    return [self getRootView:self];
}

- (UIView *)getRootView:(UIView *)view {
    if (view.superview) {
        return [self getRootView:view.superview];
    }
    return view;
}

- (void)assignmentForMaxSize:(CGSize)size {
    CGFloat maxWidth, maxHeight;
    ViewParams *vp = self.viewParams;
    if (self.viewParams.visibility != ViewVisibilityGone ) {
        switch (vp.widthValueType) {
            default:
            case AUTO:
            case FULL:
                maxWidth = size.width;
                break;
            case PERCENT:
                maxWidth = self.superview.maxWidth * vp.width / 100.0;
                break;
            case VALUE:
                maxWidth = vp.width;
                break;
                
        }
        
        switch (vp.heightValueType) {
            default:
            case AUTO:
            case FULL:
                maxHeight = size.height;
                break;
            case PERCENT:
                maxHeight = self.superview.maxHeight * vp.height / 100.0;
                break;
            case VALUE:
                maxHeight = vp.height;
                break;
                
        }
        
        self.maxWidth = maxWidth;
        self.maxHeight = maxHeight;
    } else {
        self.maxWidth = 0;
        self.maxHeight = 0;
    }
}

- (CGSize)boundingSize {
    
//    if (self.viewParams.visibility == ViewVisibilityGone) {
//        self.width = 0;
//        self.height = 0;
//        [self boundSizeChanged];
//        return CGSizeMake(0, 0);
//    }
    
    CGSize need = [self boundingSizeNeed];
    ViewParams *vp = self.viewParams;
    CGFloat maxWidth = self.maxWidth, maxHeight = self.maxHeight;
    CGFloat width, height = 0;
    switch (vp.widthValueType) {
        default:
        case AUTO:
            width = MIN(maxWidth, need.width);
            break;
        case FULL:
            width = maxWidth;
            break;
        case PERCENT:
            width = maxWidth;
            break;
        case VALUE:
            width = MIN(maxWidth, vp.width);
            break;
    }
    switch (vp.heightValueType) {
        default:
        case AUTO:
            height = MIN(maxHeight, need.height);
            break;
        case FULL:
            height = maxHeight;
            break;
        case PERCENT:
            height = maxHeight;
            break;
        case VALUE:
            height = MIN(maxHeight, vp.height);
            break;
    }
    
    if (width == self.superview.maxWidth) {
        width = width - self.layoutParams.marginLeft - self.layoutParams.marginRight;
    }
    
    if (height == self.superview.maxHeight) {
        height = height - self.layoutParams.marginTop - self.layoutParams.marginBottom;
    }
    
    self.width = width;
    self.height = height;
    [self boundSizeChanged];
    return CGSizeMake(width, height);
}

- (void)boundSizeChanged {
//    Log(@"boundingSize %@: %f x %f",[self class], self.boundWidth, self.boundHeight);
}

- (CGSize)boundingSizeNeed {
    return CGSizeZero;
}

- (void)refreshLayoutCompleted {
}

- (void)setShapeLayer:(CAShapeLayer *)shapeLayer {
    objc_setAssociatedObject(self, &shapeLayerKey, shapeLayer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(CAShapeLayer *)shapeLayer {
    return objc_getAssociatedObject(self, &shapeLayerKey);
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ (x:%f, y:%f)(w:%f,h:%f)",
            self.viewParams,
            self.frame.origin.x,
            self.frame.origin.y,
            self.frame.size.width,
            self.frame.size.height
            ];
}

- (id)copy {
    UIView *view = [[[self class] alloc] initWithViewParams:self.viewParams];
    view.layoutParams = self.layoutParams;
    return view;
}

@end
