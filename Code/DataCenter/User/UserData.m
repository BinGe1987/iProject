//
//  UserData.m
//  APP
//
//  Created by BinGe on 2018/12/10.
//

#import "UserData.h"

@implementation UserData

- (void)setLoginData:(id)data {
    [self setData:[data dataWithKey:@"respData"]];
}

- (void)setMineData:(id)data {
    [self setData:data];
}

- (void)setData:(Data *)data {
    [super setData:data];
    self.token =    [data stringWithKey:@"token"];
    self.userID =   [data stringWithKey:@"userId"];
    self.userName = [data stringWithKeys:@[@"name",@"userName"]];
    self.phone =    [data stringWithKey:@"phoneNum"];
    self.gender =   [data stringWithKey:@"gender" defaultValue:@"male"];
    self.level =    [data stringWithKey:@"level"];
    
    self.member =   [MemberData withData:data];
    self.recharge = [RechargeData withData:data];
    self.points =   [PointsData withData:data];
}

- (BOOL)isLogin {
    return self.token;
}

@end
