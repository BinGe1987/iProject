//
//  UIView+View.m
//  UIEngine
//
//  Created by BinGe on 2018/11/28.
//  Copyright © 2018 Bin. All rights reserved.
//

#import "UIView+View.h"

@implementation UIView (View)

static int requestLayout;
static char shapeLayerKey;


- (UIView *)findViewByName:(NSString *)name {
    return [self findViewByName:name withSuperView:self];
}

- (UIView *)findViewByName:(NSString *)name withSuperView:(UIView *)superView {
    if (superView.viewParams &&  [superView.viewParams.name isEqualToString:name]) {
        return superView;
    }
    for (UIView *view in superView.subviews) {
        UIView *realView = [self findViewByName:name withSuperView:view];
        if (realView) {
            return realView;
        }
    }
    return nil;
}

- (void)assignmentForMaxWidth:(CGFloat)width maxHeight:(CGFloat)height {
    //>=0，证明非 FULL 或 ATUO
    if (self.viewParams.visibility != ViewVisibilityGone) {
        CGFloat maxWidth = MIN(width, self.viewParams.width >= 0 ? self.viewParams.width : width);
        CGFloat maxHeight = MIN(height, self.viewParams.height >= 0 ? self.viewParams.height : height);
        self.maxWidth = maxWidth;
        self.maxHeight = maxHeight;
    } else {
        self.maxWidth = 0;
        self.maxHeight = 0;
    }
}


- (CGSize)boundingSize {
    CGSize need = [self boundingSizeNeed];
    CGFloat width, height = 0;
    if (self.viewParams.width == FULL) {
        width = self.maxWidth;
    }
    else if (self.viewParams.width == AUTO) {
        width = MIN(self.maxWidth, need.width);
    }
    else {
        width = MIN(self.maxWidth, self.viewParams.width);
    }
    
    if (self.viewParams.height == FULL) {
        height = self.maxHeight;
    }
    else if (self.viewParams.height == AUTO) {
        height = MIN(self.maxHeight, need.height);
    }
    else {
        height = MIN(self.maxHeight, self.viewParams.height);
    }
    
    self.width = width;
    if (self.width == self.maxWidth) {
        self.width = width - self.layoutParams.marginLeft - self.layoutParams.marginRight;
    }
    self.height = height;
    if (self.height == self.maxHeight) {
        self.height = height - self.layoutParams.marginTop - self.layoutParams.marginBottom;
    }
    
    [self boundSizeChanged];
    
    return CGSizeMake(width, height);
}

- (void)boundSizeChanged {
//    Log(@"boundingSize %@: %f x %f",[self class], self.boundWidth, self.boundHeight);
}

- (CGSize)boundingSizeNeed {
    return CGSizeZero;
}

- (void)requestLayout {
    Log(@"requestLayout");
    requestLayout = 1;
}

- (BOOL)isNeedRefrealLayout {
    return requestLayout == 1;
}

- (void)refreshLayoutCompleted {
    requestLayout = 0;
}

- (void)setShapeLayer:(CAShapeLayer *)shapeLayer {
    objc_setAssociatedObject(self, &shapeLayerKey, shapeLayer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(CAShapeLayer *)shapeLayer {
    return objc_getAssociatedObject(self, &shapeLayerKey);
}

///显示边框，界面调试的时候可以打开
- (void)showframe {
    /*
     *画虚线
     */
    if (!self.shapeLayer) {
        self.shapeLayer = [CAShapeLayer layer];
        [self.layer addSublayer:self.shapeLayer];
    }
    CAShapeLayer *dotteShapeLayer = self.shapeLayer;
    CGMutablePathRef dotteShapePath =  CGPathCreateMutable();
    [dotteShapeLayer setFillColor:[[UIColor clearColor] CGColor]];
    [dotteShapeLayer setStrokeColor:[self.backgroundColor CGColor]];
    dotteShapeLayer.lineWidth = 2.0f ;
    NSArray *dotteShapeArr = [[NSArray alloc] initWithObjects:[NSNumber numberWithInt:10],[NSNumber numberWithInt:5], nil];
    [dotteShapeLayer setLineDashPattern:dotteShapeArr];
    CGPathMoveToPoint(dotteShapePath, NULL, 0,0);
    CGPathAddLineToPoint(dotteShapePath, NULL, self.width, 0);
    CGPathAddLineToPoint(dotteShapePath, NULL, self.width,self.height);
    CGPathAddLineToPoint(dotteShapePath, NULL, 0,self.height);
    [dotteShapeLayer setPath:dotteShapePath];
    CGPathRelease(dotteShapePath);
}

@end
