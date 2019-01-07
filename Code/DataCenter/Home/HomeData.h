//
//  HomeData.h
//  APP
//
//  Created by BinGe on 2018/12/25.
//

#import "Data.h"
#import "BannerData.h"
#import "ClassifyData.h"
#import "TechData.h"
#import "ClubListData.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeData : Data

@property (nonatomic, strong) NSMutableArray *banner;

@property (nonatomic, strong) NSMutableArray *classify;

@property (nonatomic, strong) NSMutableArray *tech;

@property (nonatomic, strong) ClubListData *club;

@end

NS_ASSUME_NONNULL_END
