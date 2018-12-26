//
//  FrameLayout.m
//  UIEngine
//
//  Created by BinGe on 2018/11/30.
//  Copyright © 2018 Bin. All rights reserved.
//

#import "FrameLayout.h"

@implementation FrameLayout

- (CGSize)boundingSizeNeed {
    CGFloat width = 0, height = 0;
    for (UIView *view in self.subviews) {
        CGSize size = [view boundingSize];
        
        width = MAX(width, size.width);
        height = MAX(height, size.height);
    }
    width = width + self.viewParams.paddingLeft + self.viewParams.paddingRight;
    height = height + self.viewParams.paddingTop + self.viewParams.paddingBottom;
    return CGSizeMake(width, height);
}

- (void)onLayout {
    for (UIView *subView in self.subviews) {
        //布局
        CGRect r = subView.frame;
        r.size.width = subView.width;
        r.size.height = subView.height;
        
        FrameLayoutParams *params = (FrameLayoutParams *)subView.layoutParams;
        r.origin.x = subView.layoutParams.marginLeft;
        r.origin.y = subView.layoutParams.marginTop;
        if (params.gravity & FrameLayoutGravityCenter) {
            r.origin.x = self.width / 2 - subView.width / 2
                    + subView.layoutParams.marginLeft - subView.layoutParams.marginRight;
            r.origin.y = self.height / 2 - subView.height / 2
                    + subView.layoutParams.marginTop - subView.layoutParams.marginBottom;
        }
        if (params.gravity & FrameLayoutGravityLeft) {
            r.origin.x = subView.layoutParams.marginLeft;
        }
        else if (params.gravity & FrameLayoutGravityRight) {
            r.origin.x = self.width - subView.width - subView.layoutParams.marginRight;
        }
        if (params.gravity & FrameLayoutGravityTop) {
            r.origin.y = subView.layoutParams.marginTop;
        }
        else if (params.gravity & FrameLayoutGravityBottom) {
            r.origin.y = self.height - subView.height - subView.layoutParams.marginBottom;
        }
        subView.frame = r;
        
//        //大小
//        CGRect b = subView.bounds;
//        b.origin.x = subView.viewParams.paddingLeft;
//        b.origin.y = subView.viewParams.paddingTop;
//        b.size.width = subView.boundWidth;
//        b.size.height = subView.boundHeight;
//        subView.bounds = b;
//
    }
}


@end
