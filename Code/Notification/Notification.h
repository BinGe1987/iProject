//
//  Notification.h
//  APP
//
//  Created by BinGe on 2018/12/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Notification : NSObject

///登录相关的通知
+ (void)addLoginStatusObserver:(id)observer selector:(SEL)selector;
+ (void)postLoginStatusNotification:(id)object;

+ (void)removeObserver:(id)observer;

@end

NS_ASSUME_NONNULL_END

