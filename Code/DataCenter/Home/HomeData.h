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
#import "ClubData.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeData : Data

@property (nonatomic, strong) NSArray *banner;

@property (nonatomic, strong) NSArray *classify;

@property (nonatomic, strong) NSArray *tech;

@property (nonatomic, strong) NSArray *club;

@end

NS_ASSUME_NONNULL_END
