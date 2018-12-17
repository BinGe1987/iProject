//
//  AppDelegate.h
//  YDD
//
//  Created by BinGe on 2018/12/6.
//


#pragma mark APP相关的宏

#define APPDELEGATE (AppDelegate*)[UIApplication sharedApplication].delegate

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@end

