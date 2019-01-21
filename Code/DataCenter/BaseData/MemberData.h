//
//  MenberData.h
//  APP
//
//  Created by BinGe on 2019/1/3.
//

#import "Data.h"

NS_ASSUME_NONNULL_BEGIN

@interface MemberData : Data

///会员等级
@property (nonatomic, assign) NSInteger level;
///会员称号
@property (nonatomic, copy) NSString *title;
///会员剩余天数
@property (nonatomic, assign) NSInteger remainDays;



@end

NS_ASSUME_NONNULL_END
