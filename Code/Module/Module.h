//
//  Module.h
//  YDD
//
//  Created by BinGe on 2018/12/6.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Module : NSObject

/// 启动，appdelegate启动时调用
+ (void)launch;


/////获取网络配置信息
//+ (void)configure:(void (^)(void))finish;
/////打开登录页
//+ (void)startLoginAnimated:(BOOL)flag;

@end

NS_ASSUME_NONNULL_END
