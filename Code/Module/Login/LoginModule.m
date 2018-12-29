//
//  LoginModule.m
//  APP
//
//  Created by BinGe on 2018/12/24.
//

#import "LoginModule.h"
#import "LoginViewController.h"

@implementation LoginModule

- (void)setup:(BuildConfiguration)buildConfiguration {
    NSDictionary *params = @{};
    [DataCenter perform:OperationLoginCheck params:params callback:^(id  _Nonnull operation, id  _Nullable data) {
        
        LoginData *user = (LoginData *)data;
        if (!user.isLogin) {
            [LoginViewController presentSelfAnimated:NO data:nil completion:nil];
        }
        [self loginCheckCompleted];
    }];
}

- (void)loginCheckCompleted {
    
}

@end
