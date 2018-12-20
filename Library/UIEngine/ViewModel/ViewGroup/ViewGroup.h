//
//  ViewGroup.h
//  UIEngine
//
//  Created by BinGe on 2018/11/28.
//  Copyright © 2018 Bin. All rights reserved.
//

#import "UIView+View.h"
#import "GroupViewParams.h"

@protocol ViewGroupDelegate <NSObject>

- (void)onLayout;

- (void)addView:(UIView *)subView;

- (void)removeView:(UIView *)subView;

@end

NS_ASSUME_NONNULL_BEGIN

@interface ViewGroup : UIView<ViewGroupDelegate>

- (void)layoutWithMaxWidth:(CGFloat)width maxHeight:(CGFloat)height completed:(void(^)(void))block;

@end

NS_ASSUME_NONNULL_END
