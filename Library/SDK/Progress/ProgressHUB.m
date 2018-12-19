//
//  ProgressHUB.m
//  APP
//
//  Created by BinGe on 2018/12/19.
//
#define TOP_WINDOW (UIWindow*)[UIApplication sharedApplication].delegate.window

#import "ProgressHUB.h"
#import "MBProgressHUD.h"

static NSInteger progressViewKey = 10101010101010101;

@implementation ProgressHUB

+ (void)show {
    UIWindow *window = TOP_WINDOW;
    UIView *view = [window viewWithTag:progressViewKey];
    if (!view) {
        view = [[UIView alloc] initWithFrame:window.bounds];
        [window addSubview:view];
        [window bringSubviewToFront:view];
    }
    [MBProgressHUD showHUDAddedTo:view animated:YES];
}

- (void)dismiss {
    UIWindow *window = TOP_WINDOW;
    UIView *view = [window viewWithTag:progressViewKey];
    if (!view) {
        [MBProgressHUD hideHUDForView:view animated:YES];
        [view removeFromSuperview];
    }
    
}

@end
