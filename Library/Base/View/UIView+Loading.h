//
//  UIView+Loading.h
//  APP
//
//  Created by BinGe on 2019/1/21.
//

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSInteger, LoadingViewLayoutGravity) {
    
    LoadingViewGravityLeft      = 1 << 0,// 0000 0001
    LoadingViewGravityTop       = 1 << 1,// 0000 0010
    LoadingViewGravityRight     = 1 << 2,// 0000 0100
    LoadingViewGravityBottom    = 1 << 3,// 0000 1000
    LoadingViewGravityCenter    = 1 << 4 // 0001 0000
};

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Loading)

- (void)showLoadingViewGrivaty:(LoadingViewLayoutGravity)gravity padding:(UIEdgeInsets)padding;
- (void)showLoadingViewGrivaty:(LoadingViewLayoutGravity)gravity padding:(UIEdgeInsets)padding color:(UIColor *)color;

- (void)stopLoading;

@end

NS_ASSUME_NONNULL_END
