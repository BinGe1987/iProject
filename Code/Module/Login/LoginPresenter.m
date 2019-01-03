//
//  LoginPresenter.m
//  APP
//
//  Created by BinGe on 2018/12/30.
//

#import "LoginPresenter.h"
#import "LoginViewHandler.h"

@interface LoginPresenter()<ViewHandlerDelegate>

@end

@implementation LoginPresenter

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    self.handler = [[LoginViewHandler alloc] initWithView:view];
    self.handler.delegate = self;
    return self;
}

- (void)onViewAction:(id)action data:(id)data {
    
    //倒数，获取验证码
    if ([action isEqualToString:@"startCount"]) {
        [DataCenter perform:OperationLoginVerifyCode params:data callback:^(id  _Nonnull operation, Data *  _Nullable data) {
            if (data.isSuccess) {
                
            } else {
                LoginViewHandler *handler = (LoginViewHandler *)self.handler;
                [handler error:data.errorMessage];
            }
        }];
    }
    
    else if ([action isEqualToString:@"Login"]) {
        [DataCenter perform:OperationLogin params:data callback:^(id  _Nonnull operation, Data *  _Nullable data) {
            LoginViewHandler *handler = (LoginViewHandler *)self.handler;
            if (data.isSuccess) {
                [handler loginSuccess:(UserData *)data];
            } else {
                LoginViewHandler *handler = (LoginViewHandler *)self.handler;
                [handler error:data.errorMessage];
            }
        }];
    }
}

@end
