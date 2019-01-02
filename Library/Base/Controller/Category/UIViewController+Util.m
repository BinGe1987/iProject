//
//  UIViewController+Util.m
//  APP
//
//  Created by BinGe on 2018/12/14.
//

#import "UIViewController+Util.h"

@implementation UIViewController (Util)

+ (void)pushController:(NSString *)controller animated:(BOOL)animated data:(id __nullable)data {
    UIViewController *topController = [UIViewController topViewController];
    UIViewController *vc = [[NSClassFromString(controller) alloc] init];
    vc.intentData = data;
    [topController.navigationController pushViewController:vc animated:animated];
}

+ (void)pushSelfAnimated:(BOOL)animated data:(id __nullable)data {
    UIViewController *topController = [UIViewController topViewController];
    UIViewController *vc = [[[self class] alloc] init];
    vc.intentData = data;
    [topController.navigationController pushViewController:vc animated:animated];
}

+ (void)presentSelfAnimated:(BOOL)animated data:(id __nullable)data completion:(void(^ __nullable)(void))completion {
    UIViewController *topController = [UIViewController topViewController];
    UIViewController *vc = [[[self class] alloc] init];
    vc.intentData = data;
    [topController presentViewController:vc animated:animated completion:completion];
}

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
        UIViewController *top = [(UINavigationController *)vc topViewController];
        if (top) {
            return [UIViewController getTopViewController:top];
        }
        return vc;
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        UIViewController *selvc = [(UITabBarController *)vc selectedViewController];
        if (selvc) {
            return [UIViewController getTopViewController:selvc];
        } else {
            return vc;
        }
    } else {
        return vc;
    }
    return nil;
}

@end
