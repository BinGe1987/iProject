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
@property (nonatomic, strong) NSString *consumeAvg;     //人均
@property (nonatomic, strong) NSString *consumeCount;   //消费人数
@property (nonatomic, strong) NSString *commentNum;     //评价
@property (nonatomic, strong) NSString *distance;       //距离 km
@property (nonatomic, strong) NSString *address;        //地址
@property (nonatomic, strong) NSString *startTime;      //开始时间
@property (nonatomic, strong) NSString *endTime;        //结束时间
@property (nonatomic, strong) NSString *telPhone;       //电话号码
@property (nonatomic, strong) NSString *category;       //分类

@property (nonatomic, assign) NSInteger followCount;    //关注数量
@property (nonatomic, assign) NSInteger isFollow;       //当前用户是否已关注
@property (nonatomic, assign) NSInteger serviceCount;   //项目数量
@property (nonatomic, assign) NSInteger techCount;      //技师数量

@property (nonatomic, assign) CGFloat star;           //星级
@property (nonatomic, assign) CGFloat discount;       //折扣 (单位分)
@property (nonatomic, assign) CGFloat clubDiscount;   //升级最高折扣 (单位分)
@property (nonatomic, assign) CGFloat laty;           //纬度
@property (nonatomic, assign) CGFloat lngx;           //经度

@property (nonatomic, strong) ListData *bannerList;     //会所banner



@end

NS_ASSUME_NONNULL_END
