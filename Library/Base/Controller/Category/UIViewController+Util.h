//
//  UIViewController+Util.h
//  APP
//
//  Created by BinGe on 2018/12/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (Util)

+ (void)pushSelfAnimated:(BOOL)animated data:(id __nullable)data;

+ (void)presentSelfAnimated:(BOOL)animated data:(id __nullable)data completion:(void(^ __nullable)(void))completion;

+ (UIViewController *)topViewController;

@end

NS_ASSUME_NONNULL_END
