//
//  RechargeData.h
//  APP
//
//  Created by BinGe on 2019/1/3.
//

#import "Data.h"

NS_ASSUME_NONNULL_BEGIN

@interface RechargeData : Data

///充值称号
@property (nonatomic, copy) NSString *rechargeTitle;
///当前余额
@property (nonatomic, assign) CGFloat amount;
///累计充值金额
@property (nonatomic, assign) CGFloat totalRechargeAmount;
///离下一级还需要充值金额
@property (nonatomic, assign) CGFloat nextLevelAmount;

@end

NS_ASSUME_NONNULL_END
