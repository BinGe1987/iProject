//
//  ListData.h
//  APP
//
//  Created by BinGe on 2018/12/27.
//

#import "Data.h"

NS_ASSUME_NONNULL_BEGIN

@interface ListData : Data

- (void)addData:(id)data;

- (void)clear;

- (NSArray *)list;

@end

NS_ASSUME_NONNULL_END
