//
//  DiscoverTechData.h
//  APP
//
//  Created by BinGe on 2019/1/8.
//

#import "Data.h"
#import "TechData.h"
#import "ClubData.h"

NS_ASSUME_NONNULL_BEGIN

@interface DiscoverTechData : Data

@property (nonatomic, strong) TechData *tech;
@property (nonatomic, strong) ClubData *club;

@end

NS_ASSUME_NONNULL_END
