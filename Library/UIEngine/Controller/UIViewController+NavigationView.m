//
//  UIViewController+NavigationView.m
//  APP
//
//  Created by BinGe on 2019/1/12.
//

#import "UIViewController+NavigationView.h"

@implementation UIViewController (NavigationView)

- (void)setNavigationXML:(NSString *)xml {
    UIView *view = [UIView viewWithXML:xml size:CGSizeMake([UIScreen mainScreen].bounds.size.width-24, 44)];
    [self setNavigationView:view];
    self.navigationItem.titleView = self.navigationView;
}

-(void)setNavigationView:(UIView *)contentView {
    objc_setAssociatedObject(self, @selector(navigationView), contentView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)navigationView {
    return objc_getAssociatedObject(self, _cmd);
}

@end
