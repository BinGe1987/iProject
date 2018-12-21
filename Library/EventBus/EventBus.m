//
//  EventBus.m
//  APP
//
//  Created by BinGe on 2018/12/20.
//

#import "EventBus.h"


/**
 事件对象
 */
@interface EventObject : NSObject
@property (nonatomic, assign) SEL selector;
@property (nonatomic, strong) NSString *name;
@end
@implementation EventObject
@end

@interface EventBus()

@property (nonatomic, strong) NSMapTable *eventMap;

@end

@implementation EventBus

#pragma mark EventBus对外的静态方法

+ (void)addObserver:(id)observer selector:(SEL)selector event:(EventName)name {
    [EventBus addObserver:observer selector:selector event:name forceThread:EventForceThreadCurrent] ;
}

+ (void)addObserver:(id)observer selector:(SEL)selector event:(EventName)name forceThread:(EventForceThread)thread {
    [[EventBus get] addObserver:observer selector:selector event:name forceThread:thread];
}

+ (void)postEvent:(EventName)name data:(nullable id)data {
    [EventBus postEvent:name data:data forceThread:EventForceThreadCurrent];
}

+ (void)postEvent:(EventName)name data:(nullable id)data forceThread:(EventForceThread)thread {
    [[EventBus get] postEvent:name data:data forceThread:thread];
}

#pragma mark 单例内部方法
static EventBus *eventBus;
+ (EventBus *)get {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        eventBus = [[super alloc] initSingleton];
        eventBus.eventMap = [NSMapTable mapTableWithKeyOptions:NSMapTableWeakMemory valueOptions:NSMapTableStrongMemory];
    });
    return eventBus;
}

- (instancetype)initSingleton {
    return [super init];
}

- (void)addObserver:(id)observer selector:(SEL)selector event:(EventName)name forceThread:(EventForceThread)thread {
    NSMutableDictionary *dic = [[EventBus get] dictionaryWithObserver:observer];
    [dic setObject:NSStringFromSelector(selector) forKey:name];
}

- (void)postEvent:(EventName)name data:(nullable id)data forceThread:(EventForceThread)thread {
    for (id observer in self.eventMap) {
        NSMutableDictionary *dic = [self.eventMap objectForKey:observer];
        for (NSString *n in [dic allKeys]) {
            if ([n isEqualToString:name]) {
                SEL sel = NSSelectorFromString([dic objectForKey:n]);
                switch (thread) {
                    default:
                    case EventForceThreadCurrent:
                        [observer performSelector:sel withObject:data afterDelay:0];
                        break;
                    case EventForceThreadMain:
                        [observer performSelectorOnMainThread:sel withObject:data waitUntilDone:NO];
                    case EventForceThreadChild:
                        break;
                }
            }
        }
    }
}



- (NSMutableDictionary *)dictionaryWithObserver:(id)observer {
    NSMapTable *map = self.eventMap;
    NSMutableDictionary *dic = [map objectForKey:observer];
    if (!dic) {
        dic = [NSMutableDictionary new];
        [map setObject:dic forKey:observer];
    }
    return dic;
}

@end
