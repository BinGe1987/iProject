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

- (void)pushController:(NSString *)controllerClass withData:(id)data animated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END
