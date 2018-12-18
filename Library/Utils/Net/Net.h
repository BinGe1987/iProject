//
//  Net.h
//  APP
//
//  Created by BinGe on 2018/12/18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Net : NSObject

+ (void)configWithBaseUrl:(NSString *)baseUrl;

+ (id)postRequest:(NSURL *)url params:(id)params;

@end

NS_ASSUME_NONNULL_END
