//
//  UserHandler.m
//  YDD
//
//  Created by BinGe on 2018/12/5.
//

#import "UserHandler.h"

@interface UserHandler()<IParser>

@property (nonatomic, strong) UserData *userData;

@end

@implementation UserHandler

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.userData = [[UserData alloc] init];
        [self bind:OperationLoginCheck parser:self];
        [self bind:OperationLogin parser:self];
    }
    return self;
}

- (id _Nullable )parse:(_Nonnull id)operation withSource:(id _Nullable )source {
    if ([source isSuccess]) {
        if ([operation isEqualToString:OperationLogin]) {
            [self.userData setLoginData:source];
        }
        else if ([operation isEqualToString:OperationLoginCheck]) {
            [self.userData setLoginData:source];
        }
        //保存token到本地
        [Store setValue:self.userData.token forKey:@"token"];
        //广播登录状态改变事件
        [EventBus postEvent:EventLoginStatusChanged data:self.userData forceThread:YES];
        
        return self.userData;
    }
    return source;
}

-(id)getData {
    return self.userData;
}

@end
