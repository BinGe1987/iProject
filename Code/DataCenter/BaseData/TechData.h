//
//  TechData.h
//  APP
//
//  Created by BinGe on 2018/12/25.
//

#import "Data.h"

NS_ASSUME_NONNULL_BEGIN

@interface TechData : Data

@property (nonatomic, copy) NSString *techID;
@property (nonatomic, copy) NSString *number;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *imageUrl;
@property (nonatomic, copy) NSString *phone;
@property (nonatomic, copy) NSString *clubId;
@property (nonatomic, copy) NSString *createTime;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *gender;

@property (nonatomic, assign) CGFloat score;

@property (nonatomic, assign) NSInteger browseNum;
@property (nonatomic, assign) NSInteger followNum;
@property (nonatomic, assign) NSInteger commentNum;

@property (nonatomic, strong) NSArray *images;

@end

NS_ASSUME_NONNULL_END
