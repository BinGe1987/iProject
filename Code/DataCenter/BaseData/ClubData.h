//
//  ClubData.h
//  APP
//
//  Created by BinGe on 2018/12/25.
//

#import "Data.h"

NS_ASSUME_NONNULL_BEGIN

@interface ClubData : Data

@property (nonatomic, strong) NSString *clubID;         //会所id
@property (nonatomic, strong) NSString *name;           //会所名称
@property (nonatomic, strong) NSString *imageUrl;       //会所logo
@property (nonatomic, strong) NSString *regionName;     //区域名称
@property (nonatomic, strong) NSString *areaName;       //区域下属名称
@property (nonatomic, strong) NSString *tag;            //会所标签
@property (nonatomic, strong) NSString *star;           //星级
@property (nonatomic, strong) NSString *consumeAvg;     //人均
@property (nonatomic, strong) NSString *consumeCount;   //消费人数
@property (nonatomic, strong) NSString *commentNum;     //评价
@property (nonatomic, strong) NSString *distance;       //距离 km
@property (nonatomic, strong) NSString *discount;       //折扣 (单位分)
@property (nonatomic, strong) NSString *clubDiscount;   //升级最高折扣 (单位分)
@property (nonatomic, strong) NSString *laty;           //纬度
@property (nonatomic, strong) NSString *lngx;           //经度



@end

NS_ASSUME_NONNULL_END
