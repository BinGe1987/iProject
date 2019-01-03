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
@property (nonatomic, copy) NSString *nowPoints;
///本月获取积分
@property (nonatomic, copy) NSString *monthPoints;

@end

NS_ASSUME_NONNULL_END
