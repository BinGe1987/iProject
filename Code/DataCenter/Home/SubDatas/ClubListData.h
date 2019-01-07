//
//  ClubListData.h
//  APP
//
//  Created by BinGe on 2019/1/7.
//

#import "ListData.h"
#import "CLubData.h"

NS_ASSUME_NONNULL_BEGIN

@interface ClubListData : ListData

@property (nonatomic, assign) NSInteger pageCurrent;
@property (nonatomic, assign) NSInteger pageCount;

@end

NS_ASSUME_NONNULL_END
