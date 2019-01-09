//
//  ClubServiceData.h
//  APP
//
//  Created by BinGe on 2019/1/9.
//

#import "Data.h"

NS_ASSUME_NONNULL_BEGIN

@interface ClubServiceData : Data

@property (nonatomic, copy) NSString *serviceID;        //id
@property (nonatomic, copy) NSString *name;             //项目名
@property (nonatomic, copy) NSString *imageUrl;         //项目图片
@property (nonatomic, copy) NSString *unit;             //项目单位（次/分钟）

@property (nonatomic, assign) NSInteger amount;         //价格包含的数量
@property (nonatomic, assign) NSInteger price;          //优惠后的价格
@property (nonatomic, assign) NSInteger originalPrice;  //原价
@property (nonatomic, assign) NSInteger savePrice;      //省下的价格

@end

NS_ASSUME_NONNULL_END
