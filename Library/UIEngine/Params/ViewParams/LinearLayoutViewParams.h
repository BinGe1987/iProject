//
//  LinearViewParams.h
//  APP
//
//  Created by BinGe on 2018/12/10.
//

#import "GroupViewParams.h"

typedef enum : NSUInteger {
    OrientationVertical,
    OrientationHorizontal
} LinearLayoutOrientation;

NS_ASSUME_NONNULL_BEGIN

@interface LinearLayoutViewParams : GroupViewParams


//线性布局的方向
@property (nonatomic, assign) LinearLayoutOrientation orientation;

@end

NS_ASSUME_NONNULL_END
