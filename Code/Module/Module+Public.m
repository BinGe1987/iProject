//
//  Module+Public.m
//  APP
//
//  Created by BinGe on 2018/12/21.
//

#import "Module+Public.h"
#import "LoginViewController.h"

@implementation Module (Public)

+ (void)login {
    UIViewController *vc = [UIViewController topViewController];
    [vc.navigationController pushViewController:[[LoginViewController alloc] init] animated:YES];
}

@end
