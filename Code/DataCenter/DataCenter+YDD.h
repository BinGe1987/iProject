//
//  DataCenter+YDD.h
//  APP
//
//  Created by BinGe on 2018/12/10.
//

#import "DataCenter.h"
#import "Data+Update.h"
#import "ConfigHandler.h"
#import "LoginHandler.h"
#import "UserHandler.h"
#import "HomeHandler.h"

NS_ASSUME_NONNULL_BEGIN

#pragma make 全局
///获取配置信息
#define OperationGetConfig (@"OperationGetConfig")
///自动登录
#define OperationLoginCheck (@"OperationLoginCheck")

#pragma make 首页相关
///获取首面信息
#define OperationGetHomeData (@"OperationGetHomeData")

@interface DataCenter (YDD)

///获取配置信息
- (ConfigData *)configData;

///获取用户信息
- (UserData *)userData;

//获取首页数据
- (HomeData *)homeData;

@end

NS_ASSUME_NONNULL_END
