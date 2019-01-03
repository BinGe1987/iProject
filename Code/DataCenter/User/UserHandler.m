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
        [self.userData setData:source];
        return self.userData;
    }
    return source;
}

-(id)getData {
    return self.userData;
}

@end
