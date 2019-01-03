//
//  LoginModule.m
//  APP
//
//  Created by BinGe on 2018/12/24.
//

#import "LoginModule.h"

@implementation LoginModule

- (void)setup:(BuildConfiguration)buildConfiguration {
    NSString *token = [Store valueForKey:@"token" defaultValue:@""];
    NSDictionary *params = @{
                             @"api":API_CheckLogin,
                             @"token":token,
                             };
    [DataCenter perform:OperationLoginCheck params:params callback:^(id  _Nonnull operation, id  _Nullable data) {
        
        LoginData *user = (LoginData *)data;
        if (!user.isLogin) {
            [UIViewController presentController:@"LoginViewController" animated:NO data:nil completion:nil];
        }
        
        [self loginCheckCompleted];
    }];
}

- (void)loginCheckCompleted {
    
}

@end
