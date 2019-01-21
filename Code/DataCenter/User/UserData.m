//
//  UserData.m
//  APP
//
//  Created by BinGe on 2018/12/10.
//

#import "UserData.h"

@implementation UserData

- (void)setLoginData:(id)data {
    [super setData:data];
    [self set:[data dataWithKey:@"respData"]];
}

- (void)setMineData:(id)data {
    [super setData:data];
    [self set:[data dataWithKey:@"respData"]];
}

- (void)setData:(Data *)data {
    [super setData:data];
    [self set:[data dataWithKey:@"respData"]];
}

- (void)set:(Data *)data {
    self.token =    [data stringWithKey:@"token" defaultValue:self.token];
    self.userID =   [data stringWithKey:@"userId" defaultValue:self.userID];
    self.userName = [data stringWithKeys:@[@"name",@"userName",@"nickName"]];
    self.phone =    [data stringWithKeys:@[@"phoneNum",@"phone"]];
    self.gender =   [data stringWithKey:@"gender" defaultValue:@"male"];
    self.level =    [data stringWithKey:@"level"];
    self.avatarUrl = [data stringWithKey:@"avatarUrl"];
    
    self.member =   [MemberData withData:data];
    self.recharge = [RechargeData withData:data];
    self.points =   [PointsData withData:data];
}

- (BOOL)isLogin {
    return self.token;
}

- (BOOL)isSuccess {
    return [self isLogin];
}

- (NSString *)genderLabel {
    return self.gender ? ([self.gender isEqualToString:@"male"] ? @"男":@"女") : @"未知";
}

@end
