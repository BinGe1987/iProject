//
//  BaseTabBarController.h
//  YDD
//
//  Created by BinGe on 2018/12/6.
//

#import <UIKit/UIKit.h>
#import "ThirdLibraryHeader.h"//第三方库

NS_ASSUME_NONNULL_BEGIN

@interface TabbarController : UITabBarController

///添加一个tab
- (void)addTab:(NSString *)title image:(UIImage *)image controller:(UIViewController *)viewController;

- (void)addTab:(NSString *)title
        selectedImage:(UIImage *)selected
        unselectedImage:(UIImage * _Nullable )unselected
        controller:(UIViewController *)viewController;
- (void)addTab:(NSString *)title
        selectedColor:(UIColor * _Nullable)selectedColor
        unselectedColor:(UIColor * _Nullable )unselectedColor
        selectedImage:(UIImage *)selectedImage
        unselectedImage:(UIImage * _Nullable )unselectedImage
        controller:(UIViewController *)viewController;

@end

NS_ASSUME_NONNULL_END
