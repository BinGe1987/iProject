//
//  EventBus.h
//  APP
//
//  Created by BinGe on 2018/12/20.
//

#import <Foundation/Foundation.h>

typedef NSString *EventName NS_EXTENSIBLE_STRING_ENUM;

NS_ASSUME_NONNULL_BEGIN

@interface EventBus : NSObject

+ (void)addObserver:(id)observer selector:(SEL)selector event:(EventName)name;

+ (void)postEvent:(EventName)name data:(nullable id)data;

@end

NS_ASSUME_NONNULL_END
