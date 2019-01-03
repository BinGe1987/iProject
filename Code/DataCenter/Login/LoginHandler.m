//
//  LoginHandler.m
//  YDD
//
//  Created by BinGe on 2018/12/5.
//

#import "LoginHandler.h"
#import "LoginPerformer.h"
#import "CheckLoginPerfomer.h"
#import "VerifyCodePerformer.h"

@interface LoginHandler()<IParser>

@property (nonatomic, strong) LoginData *loginData;

@end

@implementation LoginHandler

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.loginData = [LoginData new];
        [self bind:OperationLoginCheck performer:[CheckLoginPerfomer new]];
        [self bind:OperationLogin performer:[LoginPerformer new]];
        [self bind:OperationLoginVerifyCode performerPlus:[VerifyCodePerformer class]];
        
    }
    return self;
}

- (id)parse:(id)operation withSource:(id)source {
    return source;
}

-(id)getData {
    return self.loginData;
}

@end
