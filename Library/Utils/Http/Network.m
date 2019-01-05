//
//  Network.m
//  APP
//
//  Created by BinGe on 2019/1/5.
//

#import "Network.h"
#import "Reachability.h"

@interface Network()

@property (nonatomic, strong) Reachability *routerReachability;
@property (nonatomic, strong) Reachability *hostReachability;

@end

@implementation Network

static Network *network;

+ (Network *)get {
    if (!network) {
        network = [Network new];
        network.routerReachability = [Reachability reachabilityWithHostName:@"www.baidu.com"];
        
//        [[NSNotificationCenter defaultCenter] addObserver:network
//                                                 selector:@selector(reachabilityChanged:)
//                                                     name:kReachabilityChangedNotification
//                                                   object:nil];
//        [network.routerReachability startNotifier];
//
//
        network.hostReachability = [Reachability reachabilityForInternetConnection];
    }
    return network;
}

+ (void)start {
    [Network get];
}

- (void)reachabilityChanged:(NSNotification *)notification {
    Reachability *reach = [notification object];
    
    if([reach isKindOfClass:[Reachability class]]){
        NetworkStatus status = [reach currentReachabilityStatus];
        if (status == NotReachable) {
            NSLog(@"routerReachability NotReachable");
        } else if (status == ReachableViaWiFi) {
            NSLog(@"routerReachability ReachableViaWiFi");
        } else if (status == ReachableViaWWAN) {
            NSLog(@"routerReachability ReachableViaWWAN");
        }
    }
}

+ (BOOL)isNetworkOK {
    Reachability *reach = [Reachability reachabilityForInternetConnection];
    NetworkStatus status = [reach currentReachabilityStatus];
    if (status == NotReachable) {
        return NO;
    }
    return YES;
//    NetworkStatus status = [[Network get].routerReachability currentReachabilityStatus];
//    if (status == NotReachable) {
//        NSLog(@"routerReachability NotReachable");
//        return NO;
//    } else if (status == ReachableViaWiFi) {
//        NSLog(@"routerReachability ReachableViaWiFi");
//    } else if (status == ReachableViaWWAN) {
//        NSLog(@"routerReachability ReachableViaWWAN");
//    }
//    BOOL con = [[Network get].routerReachability connectionRequired];
//
//    return YES;
}

+ (BOOL)reachabilityWithAddress:(NSString *)address {
//    Reachability *reachability = [Reachability reachabilityWithHostName:address];
//    NetworkStatus status = [reachability currentReachabilityStatus];
//    if (status == NotReachable) {
//        NSLog(@"hostReachability failed");
//        return NO;
//    } else if (status == ReachableViaWiFi) {
//        NSLog(@"hostReachability ReachableViaWiFi");
//    } else if (status == ReachableViaWWAN) {
//        NSLog(@"hostReachability ReachableViaWWAN");
//    }
//    BOOL con = [reachability connectionRequired];
    return YES;
}

@end
