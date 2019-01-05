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

#pragma make 我的页面相关
#define API_MineGetMineData             (@"/api/v1/personalInfo/getPerInfoDetail")      //获取我的页面数据



NS_ASSUME_NONNULL_BEGIN

@interface URLConstant : NSObject

+ (NSString *)host;

+ (NSString *)URLWithApi:(NSString *)api;

@end

NS_ASSUME_NONNULL_END
