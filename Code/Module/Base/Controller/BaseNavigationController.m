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
    
    self.navigationBar.translucent = NO;
    [self.navigationBar setBackgroundImage:[ImageUtils imageWithColorHex:@"#ffffffff" size:CGSizeMake(10, 10)] forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setShadowImage:[UIImage new]];
    
//    UIColor *color = UIColorMain;
    UIColor *color = [UIColor blackColor];
    [self.navigationBar setTintColor:color];
    [[UIBarButtonItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor clearColor]}forState:UIControlStateNormal];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:color}];
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    viewController.hidesBottomBarWhenPushed = YES;
    [super pushViewController:viewController animated:animated];
}

@end
