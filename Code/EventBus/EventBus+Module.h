//
//  EventBus+Module.h
//  APP
//
//  Created by BinGe on 2018/12/21.
//

///app启动并初始化完成事件
#define EventAppLaunchCompleted (@"EventAppLaunchCompleted")
///登录状态改变
#define EventLoginStatusChanged (@"EventLoginStatusChanged")

#import "EventBus.h"

NS_ASSUME_NONNULL_BEGIN

@interface EventBus (Module)

@end

NS_ASSUME_NONNULL_END
