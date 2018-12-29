//
//  LoginHandler.m
//  YDD
//
//  Created by BinGe on 2018/12/5.
//

#import "LoginHandler.h"
#import "CheckLoginPerfomer.h"

@interface LoginHandler()<IParser>

@property (nonatomic, strong) LoginData *loginData;

@end

@implementation LoginHandler

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.loginData = [LoginData new];
        [self bind:OperationLoginCheck performer:[CheckLoginPerfomer new] parser:self];
        
    }
    return self;
}

- (id)parse:(id)operation withSource:(id)source {
    
    return self.loginData;
}

-(id)getData {
    return self.loginData;
}

@end
