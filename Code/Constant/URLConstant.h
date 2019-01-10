//
//  URLConstant.h
//  APP
//
//  Created by BinGe on 2019/1/3.
//

#import <Foundation/Foundation.h>


#pragma make 域名
#define BASE_URL                        (@"http://192.168.0.16:8081")


#pragma make 登录相关
#define API_CheckLogin                  (@"/ydd-manager/api/v1/account/user/checksession")          //自动登录
#define API_Login                       (@"/ydd-manager/api/v1/account/user/login")                 //登录
#define API_VerifyCode                  (@"/ydd-manager/api/v1/account/sendVerifyCode")             //获取验证码

#pragma make 首页相关
#define API_HomeBanner                  (@"/ydd-manager/api/v1/home/banner/list")
#define API_HomeClub                    (@"/ydd-manager/api/v1/home/club/list")
#define API_HomeTech                    (@"/ydd-manager/api/v1/home/recommend/list")

#pragma make 会所相关
#define API_ClubGetFilters              (@"/ydd-manager/api/v1/config/club/search/param")           //会所过滤器
#define API_DiscoverTechHot             (@"/ydd-manager/api/v1/tech/recommend/hot/tech/list")       //头牌
#define API_DiscoverTechTop             (@"/ydd-manager/api/v1/tech/recommend/top/tech/list")       //热门

#define API_ClubGetProfile              (@"/ydd-manager/api/v1/find/club/detail")                   //会所信息
#define API_ClubGetServiceList          (@"/ydd-manager/api/v1/find/club/service/item/list")        //会所服务项目
#define API_ClubGetTechList             (@"/ydd-manager/api/v1/tech/byclub/list")                   //会所技师列表
#define API_ClubGetCommentList          (@"/ydd-manager/api/v1/find/club/commentList")              //会所评论列表

#pragma make 技师相关
#define API_TechGeProfile               (@"/ydd-manager/api/v1/tech/home/detail")                   //获取技师数据
#define API_TechGeComment               (@"/ydd-manager/api/v1/tech/comment/list")                  //获取技师评论


#pragma make 我的页面相关
#define API_MineGetMineData             (@"/ydd-manager/api/v1/personalInfo/getPerInfoDetail")      //获取我的页面数据





NS_ASSUME_NONNULL_BEGIN

@interface URLConstant : NSObject

+ (NSString *)host;

+ (NSString *)URLWithApi:(NSString *)api;

@end

NS_ASSUME_NONNULL_END
