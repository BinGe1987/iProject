//
//  UIViewController+Layout.h
//  APP
//
//  Created by BinGe on 2018/12/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (Layout)

-(void)addRefreshLayoutRunLoop;

-(void)removeRefreshLayoutRunLoop;

//刷新页面 布局
- (void)refreshLayout;

- (void)onLayoutSubViewsCompleted;

//刷新安全区大小，比如IPHONE底部会留一点空白
- (CGRect)safeRect;

@end

NS_ASSUME_NONNULL_END
