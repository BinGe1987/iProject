//
//  NavigationView.m
//  APP
//
//  Created by BinGe on 2019/1/4.
//

#import "NavigationView.h"

@implementation NavigationView

- (CGSize)boundingSizeNeed {
    return CGSizeMake(self.maxWidth, STATUSBARHIEGHT + self.viewParams.height ? self.viewParams.height : 44);
}

- (void)assignmentForMaxSize:(CGSize)size {
    [super assignmentForMaxSize:size];
}

- (void)onLayout {
    
    [self.superview bringSubviewToFront:self];
    
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
    }
}

@end
