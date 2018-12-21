//
//  EventBus.m
//  APP
//
//  Created by BinGe on 2018/12/20.
//

#import "EventBus.h"

@interface EventBus()

@property (nonatomic, strong) NSMapTable *eventMap;

@end

@implementation EventBus

+ (void)addObserver:(id)observer selector:(SEL)selector event:(EventName)name {
    [self get].eventMap setObject:<#(nullable id)#> forKey:<#(nullable id)#>
}

+ (void)postEvent:(EventName)name data:(nullable id)data {
    
}


static EventBus *eventBus;
+ (EventBus *)get {
    if (!eventBus) {
        eventBus = [EventBus new];
    }
    return eventBus;
}

- (instancetype)init {
    self = [super init];
    self.eventMap = [NSMapTable mapTableWithKeyOptions:NSMapTableCopyIn valueOptions:NSMapTableStrongMemory];
    return self;
}

@end
