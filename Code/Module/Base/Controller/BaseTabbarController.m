//
//  BaseTabbarController.m
//  APP
//
//  Created by BinGe on 2018/12/17.
//

#import "BaseTabbarController.h"

@interface BaseTabbarController ()

@end

@implementation BaseTabbarController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tabBar.translucent = NO;
    }
    return self;
}


- (void)addTab:(NSString *)title selectedColor:(UIColor *)selectedColor unselectedColor:(UIColor *)unselectedColor selectedImage:(UIImage *)selectedImage unselectedImage:(UIImage *)unselectedImage controller:(UIViewController *)viewController {
    
    //pushViewController的时候tabbar会自动隐藏，back回来的时候会自动显示
    if ([viewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *nv = (UINavigationController *)viewController;
        UIViewController *vc = nv.topViewController;
        vc.hidesBottomBarWhenPushed = NO;
    } else {
        viewController.hidesBottomBarWhenPushed = NO;
    }
    
    [super addTab:title selectedColor:selectedColor unselectedColor:unselectedColor selectedImage:selectedImage unselectedImage:unselectedImage controller:viewController];
    
}

- (BOOL)shouldAutorotate{
    return YES;
}
- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskPortrait;
}

@end
