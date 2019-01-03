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
        [DataCenter perform:OperationLoginVerifyCode params:data callback:^(id  _Nonnull operation, id  _Nullable data) {
            
        }];
    }
}

@end
