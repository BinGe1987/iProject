//
//  Net.h
//  APP
//
//  Created by BinGe on 2018/12/18.
//

#import <Foundation/Foundation.h>
#import "NetConfig.h"
#import "NetRequest.h"
#import "NetResponse.h"

NS_ASSUME_NONNULL_BEGIN

@interface Net : NSObject

+ (void)configure:(NetConfig *)config;

///同步请求
+ (NetResponse *)synchroRequest:(_Nullable id<NetRequest>)request;

///异步请求
+ (void)asynchroRequest:(_Nullable id<NetRequest>)request completed:( void(^ _Nullable )(NetResponse * response))block;

@end

NS_ASSUME_NONNULL_END
