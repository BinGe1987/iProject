//
//  UserHandler.m
//  YDD
//
//  Created by BinGe on 2018/12/5.
//

#import "UserHandler.h"
#import "UserPerformer.h"

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
        [self bind:OperationGetMineData performer:[UserPerformer new]];
        [self bind:OperationGetMineData parser:self];
    }
    return self;
}

- (id _Nullable )parse:(_Nonnull id)operation withSource:(id _Nullable )source {
    if ([source isSuccess]) {
        if ([operation isEqualToString:OperationLogin]) {
            [self.userData setLoginData:source];
            [Store setValue:self.userData.token forKey:@"token"];
            [EventBus postEvent:EventLoginStatusChanged data:self.userData forceThread:YES];
        }
        else if ([operation isEqualToString:OperationLoginCheck]) {
            [self.userData setLoginData:source];
            [Store setValue:self.userData.token forKey:@"token"];
            [EventBus postEvent:EventLoginStatusChanged data:self.userData forceThread:YES];
        }
        else if ([operation isEqualToString:OperationGetMineData]) {
            [self.userData setMineData:source];
        }
        return self.userData;
    }
    return source;
}

-(id)getData {
    return self.userData;
}

@end
