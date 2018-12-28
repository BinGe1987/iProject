//
//  OrderData.h
//  APP
//
//  Created by BinGe on 2018/12/28.
//

#import "Data.h"
#import "ClubData.h"

NS_ASSUME_NONNULL_BEGIN

@interface OrderData : Data

@property (nonatomic, strong) ClubData *clubData;               //会所数据

@property (nonatomic, strong) NSString *orderID;
@property (nonatomic, strong) NSString *writeOffCode;           //核销码
@property (nonatomic, strong) NSString *payTime;                //支付时间
@property (nonatomic, strong) NSString *payType;                //支付方式
@property (nonatomic, assign) CGFloat transAmount;              //交易金额
@property (nonatomic, assign) CGFloat reduceAmount;             //减免金额
@property (nonatomic, assign) CGFloat payAmount;                //实付金额


@end

NS_ASSUME_NONNULL_END
