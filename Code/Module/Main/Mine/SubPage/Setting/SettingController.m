//
//  SettingController.m
//  APP
//
//  Created by BinGe on 2019/1/4.
//

#import "SettingController.h"

@interface SettingController ()

@end

@implementation SettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置";
    [self setContentViewWithXML:@"SettingController.xml"];
}

- (void)viewWillAppear:(BOOL)animated {
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
}


@end
