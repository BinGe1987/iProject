//
//  UserData.h
//  APP
//
//  Created by BinGe on 2018/12/10.
//

#import "Data.h"

NS_ASSUME_NONNULL_BEGIN

@interface UserData : Data

@property (nonatomic, copy) NSString *token;
@property (nonatomic, copy) NSString *userID;
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *phone;
@property (nonatomic, copy) NSString *gender;
@property (nonatomic, copy) NSString *level;
@property (nonatomic, copy) NSString *avatarUrl;

///判断用户是否登录
- (BOOL)isLogin;

@end

NS_ASSUME_NONNULL_END
