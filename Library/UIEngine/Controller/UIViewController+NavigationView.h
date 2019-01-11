//
//  UIViewController+NavigationView.h
//  APP
//
//  Created by BinGe on 2019/1/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (NavigationView)

@property (nonatomic, strong) UIView *navigationView;

- (void)setNavigationXML:(NSString *)xml;

@end

NS_ASSUME_NONNULL_END
