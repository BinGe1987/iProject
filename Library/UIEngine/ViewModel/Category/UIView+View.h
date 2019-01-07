//
//  UIView+View.h
//  UIEngine
//
//  Created by BinGe on 2018/11/28.
//  Copyright © 2018 Bin. All rights reserved.
//
#import "UIView+Params.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIView (View)

/**
 根据view的名字找到对应的子view
 */
- (id)findViewByName:(NSString *)name;

- (UIView *)getRootView;

- (void)assignmentForMaxSize:(CGSize)size;

///给view的size最大值赋值
//- (void)assignmentForMaxWidth:(CGFloat)width maxHeight:(CGFloat)height;

///ViewParams.width的条件的约束下，实际可以给到的大小
- (CGSize)boundingSize;

///没有任何约束条件下，view所需要的最小的宽度值
- (CGSize)boundingSizeNeed;

- (void)boundSizeChanged;

///申请父布局刷新
- (void)requestLayout;

//提供给父布局判断是否需要刷新布局
- (BOOL)isNeedRefrealLayout;

//刷新布局完成
- (void)refreshLayoutCompleted;

@end

NS_ASSUME_NONNULL_END
