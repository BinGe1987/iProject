//
//  UIViewController+NavigationView.m
//  APP
//
//  Created by BinGe on 2019/1/12.
//

#import "UIViewController+NavigationView.h"

@implementation UIViewController (NavigationView)

- (void)setNavigationColor:(UIColor *)color {
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar setBackgroundImage:[ImageUtils imageWithColor:color size:CGSizeMake(10, 10)] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

- (void)setNavigationXML:(NSString *)xml {
    UIView *view = [UIView viewWithXML:xml size:CGSizeMake([UIScreen mainScreen].bounds.size.width-24, 44)];
    [self setNavigationView:view];
    self.navigationItem.titleView = self.navigationView;
    CGSize size = CGSizeMake([UIScreen mainScreen].bounds.size.width-24, 44);
    for (UIView *view in self.navigationController.navigationBar.subviews) {
        NSLog(@"1%@", NSStringFromClass(view.class));
        for (UIView *subView in view.subviews) {
            NSLog(@"2%@", NSStringFromClass(subView.class));
            if ([NSStringFromClass(subView.class) isEqualToString:@"_UITAMICAdaptorView"]) {
                size = CGSizeMake(subView.frame.size.width, subView.frame.size.height);
            }
        }
    }
    
    self.navigationController.navigationBar.backgroundColor = view.backgroundColor;
    view.backgroundColor = [UIColor clearColor];
}

-(void)setNavigationView:(UIView *)contentView {
    objc_setAssociatedObject(self, @selector(navigationView), contentView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)navigationView {
    return objc_getAssociatedObject(self, _cmd);
}

@end
