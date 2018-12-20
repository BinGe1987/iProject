//
//  NotificationCenter.h
//  APP
//
//  Created by BinGe on 2018/12/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NotificationCenter : NSObject

+ (void)addObserver:(id)observer selector:(SEL)selector name:(nullable NSNotificationName)name;

+ (void)postNotificationName:(NSNotificationName)name object:(nullable id)object;

+ (void)removeObserver:(id)observer;

@end

NS_ASSUME_NONNULL_END
