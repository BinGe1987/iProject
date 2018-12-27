//
//  DiscoverTechAdapter.h
//  APP
//
//  Created by BinGe on 2018/12/27.
//

#import "CollectionViewAdapter.h"

NS_ASSUME_NONNULL_BEGIN

@interface DiscoverTechAdapter : CollectionViewAdapter

+ (instancetype)collectionView:collection adapterWithSourceData:(NSArray<CollectionViewSection *> *)data;

@end

NS_ASSUME_NONNULL_END
