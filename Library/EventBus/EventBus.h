//
//  EventBus.h
//  APP
//
//  Created by BinGe on 2018/12/20.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    ///POST时所在的线程
    EventForceThreadCurrent,
    ///在主线程执行
    EventForceThreadMain,
    ///在子线程执行
    EventForceThreadChild
}EventForceThread;

typedef NSString *EventName NS_EXTENSIBLE_STRING_ENUM;

NS_ASSUME_NONNULL_BEGIN

@interface EventBus : NSObject

+ (void)addObserver:(id)observer selector:(SEL)selector event:(EventName)name;
+ (void)addObserver:(id)observer selector:(SEL)selector event:(EventName)name forceThread:(EventForceThread)thread;

+ (void)postEvent:(EventName)name;
+ (void)postEvent:(EventName)name data:(nullable id)data;
+ (void)postEvent:(EventName)name data:(nullable id)data forceThread:(EventForceThread)thread;

+ (void)removeObserver:(id)observer;

-(instancetype) init __attribute__((unavailable("init not available")));
+(instancetype) new __attribute__((unavailable("new not available")));
+(instancetype) allocWithZone __attribute__((unavailable("new not available")));

@end

NS_ASSUME_NONNULL_END
