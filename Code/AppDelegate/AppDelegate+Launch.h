//
//  AppDelegate+Launch.h
//  iProject
//
//  Created by BinGe on 2018/12/7.
//

#import "AppDelegate.h"

NS_ASSUME_NONNULL_BEGIN

/**
 启动页逻辑，分为两步：
 1、显示启动页
 2、播放启动页结束动画
 在第一步和第二步中间正常会有其它逻辑
 */
@interface AppDelegate (Launch)

//启动页分为两步
///第一步显示启动页
- (void)launch;
///第二步播放启动页结束动画
- (void)launchFinish:(void (^ _Nullable )(void))finish;

@end

NS_ASSUME_NONNULL_END
