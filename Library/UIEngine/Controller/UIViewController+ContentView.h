//
//  UIViewController+ContentView.h
//  APP
//
//  Created by BinGe on 2018/12/17.
//

#import "UIViewController+Layout.h"
#import "ViewGroup.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (ContentView)

///真正用于承载内容的view
@property (nonatomic, strong) UIView *contentView;

@property (nonatomic, strong) NSString *safeAreaString;

///设置controller的rootview（主界面），同时添加一个loop，当view调用requestLayout时，loop会要求根view刷新
- (void)setContentView:(UIView *)view;
///可以通过此方法在controller查找名字为name的view出来
- (id)findViewByName:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
