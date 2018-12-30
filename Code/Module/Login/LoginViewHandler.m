//
//  LoginViewHandler.m
//  APP
//
//  Created by BinGe on 2018/12/30.
//

#import "LoginViewHandler.h"

@implementation LoginViewHandler

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    UIButton *btn = (UIButton *)[view findViewByName:@"btn_login"];
    [btn setClickBlock:^(UIButton * _Nonnull button) {
        [view endEditing:YES];
        [ProgressHUB loadingTitle:@"正在登录"];
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
            sleep(3);
            [ProgressHUB dismiss];
            dispatch_async(dispatch_get_main_queue(), ^{
                [button dismissViewControllerAnimated:YES completion:nil];
            });
        });
    }];
    return self;
}

@end
