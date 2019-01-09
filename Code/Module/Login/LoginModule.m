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
    [DataCenter perform:OperationLoginCheck params:token callback:^(id  _Nonnull operation, id  _Nullable data) {
        if ([data isKindOfClass:[UserData class]] && [data isLogin]) {
            Log(@"自动登录完成。。。");
        } else {
            [UIViewController presentController:@"LoginViewController" animated:NO data:nil completion:nil];
        }
        [self loginCheckCompleted];
    }];
}

- (void)loginCheckCompleted {
    
}

@end
