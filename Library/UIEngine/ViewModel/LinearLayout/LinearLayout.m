//
//  LinearLayout.m
//  UIEngine
//
//  Created by BinGe on 2018/11/28.
//  Copyright © 2018 Bin. All rights reserved.
//

#import "LinearLayout.h"

@implementation LinearLayout

- (void)assignmentForMaxSize:(CGSize)size {
    [super assignmentForMaxSize:size];
    CGFloat width = size.width, height = size.height;
    CGFloat maxWidth = width, maxHeight = height;
    for (UIView *view in self.subviews) {
        [view assignmentForMaxSize:CGSizeMake(maxWidth, maxHeight)];
        if (self.orientation == OrientationVertical) {
            maxHeight -= view.boundingSize.height;
        } else {
            maxWidth -= view.boundingSize.width;
        }
    }
}

//- (void)assignmentForMaxWidth:(CGFloat)width maxHeight:(CGFloat)height {
//    [super assignmentForMaxWidth:width maxHeight:height];
//    CGFloat maxWidth = width, maxHeight = height;
//    for (UIView *view in self.subviews) {
//        [view assignmentForMaxWidth:maxWidth maxHeight:maxHeight];
//        if (self.orientation == OrientationVertical) {
//            maxHeight -= view.boundingSize.height;
//        } else {
//            maxWidth -= view.boundingSize.width;
//        }
//    }
//}

- (CGSize)boundingSizeNeed {
    CGSize size = self.orientation == OrientationVertical ? [self boundingSizeVertical]:[self boundingSizeHorizontal];
    size.width = size.width + self.viewParams.paddingLeft + self.viewParams.paddingRight;
    size.height = size.height + self.viewParams.paddingTop + self.viewParams.paddingBottom;
   return size;
}

- (CGSize)boundingSizeVertical {
    CGFloat width = 0;
    CGFloat height = 0;
    for (UIView *subView in self.subviews) {
        CGSize size = [subView boundingSize];
        width = MAX(width, size.width + subView.layoutParams.marginLeft + subView.layoutParams.marginRight);
        height += (size.height + subView.layoutParams.marginTop + subView.layoutParams.marginBottom);
    }
    return CGSizeMake(width, height);
}

- (CGSize)boundingSizeHorizontal {
    CGFloat width = 0;
    CGFloat height = 0;
    for (UIView *subView in self.subviews) {
        CGSize size = [subView boundingSize];
        height = MAX(height, size.height + subView.layoutParams.marginTop + subView.layoutParams.marginBottom);
        width += (size.width + subView.layoutParams.marginLeft + subView.layoutParams.marginRight);
    }
    return CGSizeMake(width, height);
}

- (void)onLayout {
    CGSize size;
    if (self.orientation != OrientationHorizontal) {
        size = [self layoutSubViewsWithVertical];
    } else {
        size = [self layoutSubViewsWithHorizontal];
    }
}

- (CGSize)layoutSubViewsWithVertical {
    CGFloat top = 0;
    CGFloat maxWidth = 0;
    CGFloat maxHeight = 0;
    for (UIView *subView in self.subviews) {
        
        NSInteger ml = subView.layoutParams.marginLeft;
        NSInteger mt = subView.layoutParams.marginTop;
        
        CGRect r = subView.frame;
        r.origin.x = ml;
        r.origin.y = top + mt;
        
        r.size.width = subView.width;
        r.size.height = subView.height;
        subView.frame = r;
        top = (r.origin.y + r.size.height);
        
//        CGRect b = subView.bounds;
//        b.origin.x = subView.viewParams.paddingLeft;
//        b.origin.y = subView.viewParams.paddingTop;
//        b.size.width = subView.boundWidth;
//        b.size.height = subView.boundHeight;
//        subView.bounds = b;
        
        maxWidth = MAX(maxWidth, subView.width);
        maxHeight += subView.height;
        maxHeight += subView.layoutParams.marginTop;
        maxHeight += subView.layoutParams.marginBottom;

    }
    return CGSizeMake(maxWidth, maxHeight);
}

- (CGSize)layoutSubViewsWithHorizontal {
    CGFloat left = 0;
    CGFloat maxWidth = 0;
    CGFloat maxHeight = 0;
    for (UIView *subView in self.subviews) {
        
        NSInteger ml = subView.layoutParams.marginLeft;
        NSInteger mt = subView.layoutParams.marginTop;
        
        CGRect r = subView.frame;
        r.origin.x = left +  ml;
        r.origin.y = mt;
        
        r.size.width = subView.width;
        r.size.height = subView.height;
        subView.frame = r;
        left = (r.origin.x + r.size.width);
        
//        CGRect b = subView.bounds;
//        b.origin.x = subView.viewParams.paddingLeft;
//        b.origin.y = subView.viewParams.paddingTop;
//        b.size.width = subView.boundWidth;
//        b.size.height = subView.boundHeight;
//        subView.bounds = b;
        
        maxHeight = MAX(maxHeight, subView.height);
        maxWidth += subView.width;
        maxWidth += subView.layoutParams.marginLeft;
        maxWidth += subView.layoutParams.marginRight;
        
    }
    return CGSizeMake(maxWidth, maxHeight);
}


@end
