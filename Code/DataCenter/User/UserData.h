//
//  UserData.h
//  APP
//
//  Created by BinGe on 2018/12/10.
//

#import "Data.h"
#import "MemberData.h"
#import "RechargeData.h"
#import "PointsData.h"

NS_ASSUME_NONNULL_BEGIN

@interface UserData : Data

@property (nonatomic, copy) NSString *token;
@property (nonatomic, copy) NSString *userID;
@property (nonatomic, copy) NSString *userName;     //昵称
@property (nonatomic, copy) NSString *phone;        //手机号码
@property (nonatomic, copy) NSString *gender;       //性别 male：男；female：女
@property (nonatomic, copy) NSString *level;        //会员等级 common：普通用户；first：初级；mid：中级；high:高级
@property (nonatomic, copy) NSString *avatarUrl;    ///用户头像Url


@property (nonatomic, strong) MemberData *member;       //用户的会员信息
@property (nonatomic, strong) RechargeData *recharge;   //充值信息
@property (nonatomic, strong) PointsData *points;       //积分信息



///判断用户是否登录
- (BOOL)isLogin;

- (void)setLoginData:(id)data;

- (void)setMineData:(id)data;

@end

NS_ASSUME_NONNULL_END
