//
//  DiscoverData.h
//  APP
//
//  Created by BinGe on 2018/12/27.
//

#import "Data.h"
#import "ListData.h"

NS_ASSUME_NONNULL_BEGIN

@interface DiscoverData : Data

@property (nonatomic, strong) ListData *club;
@property (nonatomic, strong) ListData *tech;


- (void)setClubData:(Data *)data;
- (void)addClubData:(Data *)data;

- (void)setTechData:(Data *)data;
- (void)addTechData:(Data *)data;

@end

NS_ASSUME_NONNULL_END
