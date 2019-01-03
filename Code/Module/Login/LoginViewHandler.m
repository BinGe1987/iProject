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
    
    NSString *localPhone = [Store valueForKey:@"login_phone" defaultValue:@""];
    UITextField *phoneField = (UITextField *)[view findViewByName:@"input_phone"];
    phoneField.text = localPhone;
    UITextField *codeField = (UITextField *)[view findViewByName:@"input_code"];
    UIButton *btn = (UIButton *)[view findViewByName:@"btn_code"];
    [btn setClickBlock:^(UIButton * _Nonnull button) {
        NSString *phone = phoneField.text;
        if (![Utils validateContactNumber:phone]) {
            [ProgressHUB toast:@"请输入正确的手机号码！"];
        }
    }];
    
    
//    [btn setClickBlock:^(UIButton * _Nonnull button) {
//        [view endEditing:YES];
//        [ProgressHUB loadingTitle:@"正在登录"];
////        dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
////            sleep(3);
////            [ProgressHUB dismiss];
////            dispatch_async(dispatch_get_main_queue(), ^{
////                [button dismissViewControllerAnimated:YES completion:nil];
////            });
////        });
//    }];
    return self;
}



@end
