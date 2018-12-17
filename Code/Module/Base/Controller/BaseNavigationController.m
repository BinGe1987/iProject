//
//  YDDNavigationController.m
//  YDD
//
//  Created by BinGe on 2018/12/6.
//

#import "BaseNavigationController.h"

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.navigationBar.translucent = NO;
    [self.navigationBar setBackgroundImage:[ImageUtils imageWithColorHex:@"#ffFFffff" size:CGSizeMake(10, 10)] forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setShadowImage:[UIImage new]];
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    viewController.hidesBottomBarWhenPushed = YES;
    [super pushViewController:viewController animated:animated];
}


@end
