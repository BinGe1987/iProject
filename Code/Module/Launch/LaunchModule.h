//
//  LaunchModule.h
//  APP
//
//  Created by BinGe on 2018/12/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LaunchModule : NSObject

+ (void)start;

+ (void)launchFinish:(void (^ _Nullable)(void))finish;

@end

NS_ASSUME_NONNULL_END
