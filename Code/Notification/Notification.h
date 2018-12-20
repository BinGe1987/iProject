//
//  Notification.h
//  APP
//
//  Created by BinGe on 2018/12/20.
//

#import <Foundation/Foundation.h>
#import "NotificationDefine.h"

NS_ASSUME_NONNULL_BEGIN

@interface Notification : NSObject

+ (void)addObserver:(id)observer selector:(SEL)selector name:(nullable NSNotificationName)name;
+ (void)removeObserver:(id)observer;

@end

NS_ASSUME_NONNULL_END


