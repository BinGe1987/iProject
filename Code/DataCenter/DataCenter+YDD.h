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
#import "ClubHandler.h"
#import "TechHandler.h"
#import "CommentListHandler.h"

NS_ASSUME_NONNULL_BEGIN

#pragma make 全局
///上传文件
#define OperationUploadData                     (@"OperationUploadData")
///获取配置信息
#define OperationGetConfig                      (@"OperationGetConfig")

#pragma make  登录相关
#define OperationLogin                          (@"OperationLogin")
#define OperationLoginCheck                     (@"OperationLoginCheck")
#define OperationLoginVerifyCode                (@"OperationLoginVerifyCode")

#pragma make  我的页面相关
#define OperationGetMineData                    (@"OperationGetMineData")
#define OperationGetMineFollowClubData          (@"OperationGetMineFollowClubData")
#define OperationGetMineFollowTechData          (@"OperationGetMineFollowTechData")

#pragma make 首页相关
///获取首页信息
#define OperationGetHomeData                    (@"OperationGetHomeData")
#define OperationGetHomeDataBanner              (@"OperationGetHomeDataBanner")
#define OperationGetHomeDataTech                (@"OperationGetHomeDataTech")
#define OperationGetHomeDataClubDropdown        (@"OperationGetHomeDataClubDropdown")
#define OperationGetHomeDataClubDropup          (@"OperationGetHomeDataClubDropup")

///获取会所过滤器
#define OperationGetClubFilterData              (@"OperationGetClubFilterData")
///获取会所搜索结果
#define OperationGetClubSearchData              (@"OperationGetClubSearchData")

#pragma make 发现页相关
///获取发现页信息
#define OperationGetDiscoverClubData            (@"OperationGetDiscoverClubData")
#define OperationGetDiscoverClubDataDropUp      (@"OperationGetDiscoverClubDataDropUp")
#define OperationGetDiscoverTechData            (@"OperationGetDiscoverTechData")
#define OperationGetDiscoverTechDataDropUp      (@"OperationGetDiscoverTechDataDropUp")

#pragma make  订单相关
#define OperationGetOrderData                   (@"OperationGetOrderData")

#pragma make 二级页面
///获取会所主页数据
#define OperationGetClubDetailData              (@"OperationGetClubDetailData")
///获取会所技师列表
#define OperationGetClubTechListData             (@"OperationGetClubTechListData")
///获取技师主页数据
#define OperationGetTechDetailData              (@"OperationGetTechDetailData")
///获取评论列表数据
#define OperationGetCommentListData             (@"OperationGetCommentListData")
#define OperationGetCommentCategoryData         (@"OperationGetCommentCategoryData")
#define OperationPublicCommentData              (@"OperationPublicCommentData")

@interface DataCenter (YDD)

///token
+ (NSString *)token;

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
