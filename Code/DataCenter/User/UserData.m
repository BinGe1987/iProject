//
//  UserData.m
//  APP
//
//  Created by BinGe on 2018/12/10.
//

#import "UserData.h"

@implementation UserData

- (void)setLoginData:(id)data {
    [self setData:data];
    JSON *json = [data jsonWithKey:@"respData"];
    self.token =    [json stringWithKey:@"token"];
    self.userID =   [json stringWithKey:@"userId"];
    self.userName = [json stringWithKey:@"name"];
    self.phone =    [json stringWithKey:@"phoneNum"];
    self.gender =   [json stringWithKey:@"gender" defaultValue:@"male"];
    self.level =    [json stringWithKey:@"level"];
}

- (void)setMineData:(id)data {
    [self setData:data];
}

- (BOOL)isLogin {
    return self.isSuccess && self.token;
}

@end
