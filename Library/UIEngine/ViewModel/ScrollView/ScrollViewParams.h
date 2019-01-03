//
//  ScrollViewParams.h
//  APP
//
//  Created by BinGe on 2018/12/13.
//

#import "GroupViewParams.h"

typedef enum : NSUInteger {
    ScrollOrientationVertical,
    ScrollOrientationHorizontal
} ScrollOrientation;

NS_ASSUME_NONNULL_BEGIN

@interface ScrollViewParams : GroupViewParams

//线性布局的方向
@property (nonatomic, assign) ScrollOrientation orientation;
//显不显示滚动条
@property (nonatomic, assign) BOOL scrollIndicator;

@end

NS_ASSUME_NONNULL_END
