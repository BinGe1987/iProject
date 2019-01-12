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
        
        width = MAX(width, size.width + view.layoutParams.marginLeft + view.layoutParams.marginRight);
        height = MAX(height, size.height + view.layoutParams.marginTop + view.layoutParams.marginBottom);
    }
    width = width + self.viewParams.paddingLeft + self.viewParams.paddingRight;
    height = height + self.viewParams.paddingTop + self.viewParams.paddingBottom;
    return CGSizeMake(width, height);
}

- (void)onLayout {
    
    CGFloat paddingLeft = self.viewParams.paddingLeft;
    CGFloat paddingRight = self.viewParams.paddingRight;
    CGFloat paddingTop = self.viewParams.paddingTop;
    CGFloat paddingBottom = self.viewParams.paddingBottom;
    
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
            r.origin.x += paddingLeft;
        }
        else if (params.gravity & FrameLayoutGravityRight) {
            r.origin.x = self.width - subView.width - subView.layoutParams.marginRight;
            r.origin.x -= paddingRight;
        }
        if (params.gravity & FrameLayoutGravityTop) {
            r.origin.y = subView.layoutParams.marginTop;
            r.origin.y += paddingTop;
        }
        else if (params.gravity & FrameLayoutGravityBottom) {
            r.origin.y = self.height - subView.height - subView.layoutParams.marginBottom;
            r.origin.y -= paddingBottom;
        }
        subView.frame = r;
    }
}


@end
