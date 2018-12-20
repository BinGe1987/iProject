//
//  NetStatus.m
//  APP
//
//  Created by BinGe on 2018/12/20.
//

#import "NetReachability.h"
#import "Reachability.h"

@implementation NetReachability

- (NetStatus)networkStatus {
    Reachability *reach = [Reachability reachabilityForInternetConnection];
    NetworkStatus status = [reach currentReachabilityStatus];
    return (NetStatus)status;
}

@end
