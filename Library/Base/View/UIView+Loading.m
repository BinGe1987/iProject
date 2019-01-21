//
//  UIView+Loading.m
//  APP
//
//  Created by BinGe on 2019/1/21.
//

#import "UIView+Loading.h"

@implementation UIView (Loading)
- (void)showLoadingViewGrivaty:(LoadingViewLayoutGravity)gravity padding:(UIEdgeInsets)padding {
    [self showLoadingViewGrivaty:gravity padding:padding color:[UIColor blackColor]];
}
- (void)showLoadingViewGrivaty:(LoadingViewLayoutGravity)gravity padding:(UIEdgeInsets)padding color:(UIColor *)color {
    UIActivityIndicatorView *indicator = [self activityIndicatorView];
    indicator.color = color;
    CGSize size = self.frame.size;
    CGRect frame = indicator.frame;
    
    if (gravity & LoadingViewGravityCenter) {
        frame.origin.x = size.width / 2 - CGRectGetWidth(frame) / 2;
        frame.origin.x += padding.left;
        frame.origin.x -= padding.right;
        
        frame.origin.y = size.height / 2 - CGRectGetHeight(frame) / 2;
        frame.origin.y += padding.top;
        frame.origin.y -= padding.bottom;
    }
    
    if (gravity & LoadingViewGravityLeft) {
        frame.origin.x = padding.left;
    }
    else if (gravity & LoadingViewGravityRight) {
        frame.origin.x = size.width - frame.size.width - padding.right;
    }
    
    if (gravity & LoadingViewGravityTop) {
        frame.origin.y = padding.top;
    }
    else if (gravity & LoadingViewGravityBottom) {
        frame.origin.y = size.height - frame.size.height - padding.bottom;
    }
    
    indicator.frame = frame;
    [indicator startAnimating];
}

- (void)stopLoadingAfterDelay:(NSTimeInterval)delay {
    [self performSelector:@selector(stopLoading) withObject:nil afterDelay:delay];
}

- (void)stopLoading {
    UIActivityIndicatorView *indicator = [self activityIndicatorView];
    [indicator stopAnimating];
}

- (UIActivityIndicatorView *)activityIndicatorView {
    UIView *backgroudView = [self viewWithTag:100100100100];
    if (!backgroudView) {
        backgroudView = [[UIView alloc] init];
        backgroudView.tag = 100100100100;
        [self addSubview:backgroudView];
        UIActivityIndicatorView *indicator = [backgroudView viewWithTag:200200200200];
        if (!indicator) {
            indicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:(UIActivityIndicatorViewStyleGray)];
            indicator.tag = 200200200200;
            indicator.hidesWhenStopped = YES;
            [backgroudView addSubview:indicator];
        }
    }
    backgroudView.frame = CGRectMake(0, 0, self.width, self.height);
    backgroudView.userInteractionEnabled = NO;
    return [backgroudView viewWithTag:200200200200];
}

@end
