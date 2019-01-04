//
//  PointsData.h
//  APP
//
//  Created by BinGe on 2019/1/3.
//

#import "Data.h"

NS_ASSUME_NONNULL_BEGIN

@interface PointsData : Data

///当前可用积分
@property (nonatomic, assign) NSInteger nowPoints;
///本月获取积分
@property (nonatomic, assign) NSInteger monthPoints;

@end

NS_ASSUME_NONNULL_END
