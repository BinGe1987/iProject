//
//  UIViewController+Util.m
//  APP
//
//  Created by BinGe on 2018/12/14.
//

#import "UIViewController+Util.h"

@implementation UIViewController (Util)

+ (UIViewController *)topViewController {
    UIViewController *resultVC;
    resultVC = [UIViewController getTopViewController:[[UIApplication sharedApplication].keyWindow rootViewController]];
    while (resultVC.presentedViewController) {
        resultVC = [UIViewController getTopViewController:resultVC.presentedViewController];
    }
    return resultVC;
}

+ (UIViewController *)getTopViewController:(UIViewController *)vc {
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [UIViewController getTopViewController:[(UINavigationController *)vc topViewController]];
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        return [UIViewController getTopViewController:[(UITabBarController *)vc selectedViewController]];
    } else {
        return vc;
    }
    return nil;
}

@end
