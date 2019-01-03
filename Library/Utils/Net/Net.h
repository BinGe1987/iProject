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
#import "NetReachability.h"

NS_ASSUME_NONNULL_BEGIN

@interface Net : NSObject

//singleton_interface(Net)

@property (nonatomic, strong) NetConfig *config;

///初始化配置，app启动时调用
+ (void)configure:(NetConfig *)config;

///获取当前的网络状态
+ (NetStatus)networkStatus;
+ (void)addNetworkObserver:(id)observer selector:(SEL)aSelector;
+ (void)removeNetworkObserver:(id)observer;

///同步请求
+ (NetResponse *)synchroRequest:(NetRequest * _Nonnull)request;

///异步请求
+ (void)asynchroRequest:(NetRequest * _Nonnull)request completed:( void(^ _Nullable )(NetResponse * response))block;

+ (UIImage *)requestImageWithURL:(NSURL *)url;

@end

NS_ASSUME_NONNULL_END
