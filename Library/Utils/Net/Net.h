//
//  Net.h
//  APP
//
//  Created by BinGe on 2018/12/18.
//

#import <Foundation/Foundation.h>
#import "SingletonDefine.h"
#import "NetConfig.h"
#import "NetRequest.h"
#import "NetResponse.h"

NS_ASSUME_NONNULL_BEGIN

@interface Net : NSObject

//singleton_interface(Net)

@property (nonatomic, strong) NetConfig *config;

+ (void)configure:(NetConfig *)config;

///同步请求
+ (NetResponse *)synchroRequest:(NetRequest * _Nonnull)request;

///异步请求
+ (void)asynchroRequest:(NetRequest * _Nonnull)request completed:( void(^ _Nullable )(NetResponse * response))block;

@end

NS_ASSUME_NONNULL_END
