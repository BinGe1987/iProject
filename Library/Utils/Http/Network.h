//
//  Network.h
//  APP
//
//  Created by BinGe on 2019/1/5.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Network : NSObject

+ (void)start;

+ (BOOL)isNetworkOK;

+ (BOOL)reachabilityWithAddress:(NSString *)address;

@end

NS_ASSUME_NONNULL_END
