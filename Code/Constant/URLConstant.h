//
//  URLConstant.h
//  APP
//
//  Created by BinGe on 2019/1/3.
//

#import <Foundation/Foundation.h>


#pragma make 域名
#define BASE_URL                                (@"http://192.168.0.16:8081")


#pragma make 登录相关
#define API_CHECK_LOGIN                         (@"/api/v1/account/user/checksession")
#define API_LOGIN                               (@"/api/v1/account/user/login")



NS_ASSUME_NONNULL_BEGIN

@interface URLConstant : NSObject

+ (NSString *)URLWithApi:(NSString *)api;

@end

NS_ASSUME_NONNULL_END
