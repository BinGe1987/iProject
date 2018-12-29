//
//  UIView+Controller.h
//  APP
//
//  Created by BinGe on 2018/12/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Controller)

- (UIViewController *)currentViewController;

- (void)pushController:(NSString *)controllerClass data:(id __nullable)data animated:(BOOL)animated;

- (void)popControllerAnimated:(BOOL)animated;

- (void)presentViewController:(NSString *)controllerClass data:(id __nullable)data animated:(BOOL)animated completion:(void(^ __nullable)(void))completion;

- (void)dismissViewControllerAnimated:(BOOL)animated completion:(void(^ __nullable)(void))completion;

@end

NS_ASSUME_NONNULL_END
