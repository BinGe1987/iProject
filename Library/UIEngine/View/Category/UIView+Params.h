//
//  UIView+Params.h
//  APP
//
//  Created by BinGe on 2018/12/12.
//

#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import "ViewParams.h"
#import "LayoutParams.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Params)

/**
 view有两种属性，一种自己的属性，一种相对于layout的属性
 */
@property (nonatomic, strong) ViewParams *viewParams;
@property (nonatomic, strong) LayoutParams *layoutParams;

///view的宽高，对应的是frame
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;

/**
 view在bounding后会有最大宽高，当布局中写full，auto时有用，因为这两个的宽高初值为0
 */
@property (nonatomic, assign) CGFloat maxWidth;
@property (nonatomic, assign) CGFloat maxHeight;

- (void)setVisibility:(ViewVisibility)visibility;

@end

NS_ASSUME_NONNULL_END
