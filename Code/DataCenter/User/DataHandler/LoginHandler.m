//
//  LoginHandler.m
//  YDD
//
//  Created by BinGe on 2018/12/5.
//

#import "LoginHandler.h"
#import "CheckLoginPerfomer.h"

@implementation LoginHandler

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self bind:Operation_LoginCheck performer:[CheckLoginPerfomer new] parser:nil];
    }
    return self;
}

-(id)getData {
    return nil;
}

@end
