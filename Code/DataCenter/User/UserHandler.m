//
//  UserHandler.m
//  YDD
//
//  Created by BinGe on 2018/12/5.
//

#import "UserHandler.h"

@interface UserHandler()

@property (nonatomic, strong) UserData *userData;

@end

@implementation UserHandler

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.userData = [[UserData alloc] init];
    }
    return self;
}

-(id)getData {
    return self.userData;
}

@end
