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

- (id)findViewByName:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
