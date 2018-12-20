//
//  NetStatus.m
//  APP
//
//  Created by BinGe on 2018/12/20.
//

#import "NetReachability.h"
#import "Reachability.h"

@interface NetObserver : NSObject
@property (nonatomic, weak) id observer;
@property (nonatomic, assign) SEL selector;
@end
@implementation NetObserver
@end

@interface NetReachability()

@property (nonatomic, strong) Reachability *reachability;
@property (nonatomic, strong) NSMutableArray *observers;

@end

@implementation NetReachability

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.observers = [NSMutableArray new];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged) name:kReachabilityChangedNotification object:nil];
        self.reachability = [Reachability reachabilityForInternetConnection];
        [self.reachability startNotifier];
        
    }
    return self;
}

- (NetStatus)networkStatus {
    return (NetStatus)[self.reachability currentReachabilityStatus];
}

- (void)reachabilityChanged {
    NetStatus status = [self networkStatus];
    for (NetObserver *no in [self.observers mutableCopy]) {
        if (no.observer) {
            id obs = no.observer;
            SEL sel = no.selector;
            [obs performSelector:sel withObject:@(status) afterDelay:0];
        }
        else  {
            [self.observers removeObject:no];
        }
    }
}

- (void)addNetworkObserver:(id)observer selector:(SEL)aSelector {
    NetObserver *no = [NetObserver new];
    no.observer = observer;
    no.selector = aSelector;
    [self.observers addObject:no];
}

- (void)removeNetworkObserver:(id)observer {
    for (NetObserver *no in [self.observers mutableCopy]) {
        if (no.observer) {
            if (no.observer == observer) {
                [self.observers removeObject:no];
            }
        }
        else  {
            [self.observers removeObject:no];
        }
    }
}




@end
