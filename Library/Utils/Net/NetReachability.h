//
//  NetStatus.h
//  APP
//
//  Created by BinGe on 2018/12/20.
//

#import <Foundation/Foundation.h>

typedef enum : NSInteger {
    NetStatusUnavailable = 0,
    NetStatusWiFi,
    NetStatusMobile,
    NetStatusUnknow
} NetStatus;

NS_ASSUME_NONNULL_BEGIN

@interface NetReachability : NSObject

- (NetStatus)networkStatus;

@end

NS_ASSUME_NONNULL_END
