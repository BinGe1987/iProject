//
//  HomeViewHandler.h
//  APP
//
//  Created by BinGe on 2018/12/25.
//

#import "ViewHandler.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeViewHandler : ViewHandler

- (void)setData:(id)data;

- (void)setClubData:(NSArray *)clubData;

- (void)insertClubData:(NSArray *)clubData;

@end

NS_ASSUME_NONNULL_END
