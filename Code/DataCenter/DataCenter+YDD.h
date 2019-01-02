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
#import "DiscoverHandler.h"
#import "OrderHandler.h"

NS_ASSUME_NONNULL_BEGIN

#pragma make 全局
///获取配置信息
#define OperationGetConfig (@"OperationGetConfig")
///自动登录
#define OperationLoginCheck (@"OperationLoginCheck")

#pragma make 首页相关
///获取首页信息
#define OperationGetHomeData (@"OperationGetHomeData")

#pragma make 发现页相关
///获取发现页信息
#define OperationGetDiscoverClubData (@"OperationGetDiscoverClubData")
#define OperationGetDiscoverTechData (@"OperationGetDiscoverTechData")

#pragma make  订单相关
#define OperationGetOrderData (@"OperationGetOrderData")

#pragma make 二级页面
///获取会所主页数据
#define OperationGetClubDetailData (@"OperationGetClubDetailData")


@interface DataCenter (YDD)

///获取配置信息
- (ConfigData *)configData;

///获取用户信息
- (UserData *)userData;

//获取首页数据
- (HomeData *)homeData;

//获取发现页数据
- (DiscoverData *)discoverData;

@end

NS_ASSUME_NONNULL_END
