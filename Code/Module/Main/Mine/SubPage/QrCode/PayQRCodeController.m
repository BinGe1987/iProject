//
//  PayQRCodeController.m
//  APP
//
//  Created by BinGe on 2019/1/4.
//

#import "PayQRCodeController.h"

@implementation PayQRCodeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"向商家付钱";
    [self setContentViewWithXML:@"PayQRCodeController.xml"];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.translucent = YES;
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, nil]];
    
}

@end
