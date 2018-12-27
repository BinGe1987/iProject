//
//  UIView+Controller.m
//  APP
//
//  Created by BinGe on 2018/12/27.
//

#import "UIView+Controller.h"

@implementation UIView (Controller)

- (UIViewController *)currentViewController {
    return [self viewControllerSupportView:self];
}

- (UIViewController *)viewControllerSupportView:(UIView *)view {
    for (UIView* next = [view superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

@end
