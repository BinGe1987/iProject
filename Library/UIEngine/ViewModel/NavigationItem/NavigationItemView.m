//
//  NavigationItemView.m
//  APP
//
//  Created by BinGe on 2019/1/14.
//

#import "NavigationItemView.h"

@implementation NavigationItemView

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    [self assignmentForMaxSize:frame.size];
    [self boundsAndRefreshLayout];
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
        NSLog(@"subview : %@ ",self);
    }
}
    
@end
