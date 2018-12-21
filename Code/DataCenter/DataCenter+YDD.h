//
//  DataCenter+YDD.h
//  APP
//
//  Created by BinGe on 2018/12/10.
//

#import "DataCenter.h"
#import "ConfigHandler.h"
#import "LoginHandler.h"
#import "UserHandler.h"
#import "HomeHandler.h"

NS_ASSUME_NONNULL_BEGIN

///获取配置信息
#define OperationGetConfig (@"OperationGetConfig")
///自动登录
#define OperationLoginCheck (@"OperationLoginCheck")

@interface DataCenter (YDD)

///获取配置信息
- (ConfigData *)configData;

///获取用户信息
- (UserData *)userData;

@end

NS_ASSUME_NONNULL_END
