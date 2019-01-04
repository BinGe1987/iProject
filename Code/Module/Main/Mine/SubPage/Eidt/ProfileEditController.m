//
//  ProfileEditController.m
//  APP
//
//  Created by BinGe on 2019/1/4.
//

#import "ProfileEditController.h"

@interface ProfileEditController ()

@end

@implementation ProfileEditController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"个人信息";
    [self setContentViewWithXML:@"ProfileEditController.xml"];
}

- (void)viewWillAppear:(BOOL)animated {
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
}

@end
