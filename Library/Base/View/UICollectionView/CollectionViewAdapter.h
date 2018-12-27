//
//  CollectionViewAdapter.h
//  APP
//
//  Created by BinGe on 2018/12/27.
//

#import <Foundation/Foundation.h>
#import "CollectionViewSection.h"

NS_ASSUME_NONNULL_BEGIN


static NSString *const cellId = @"cellId";
static NSString *const headerId = @"headerId";
static NSString *const footerId = @"footerId";

@interface CollectionViewAdapter : NSObject<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, assign) CGSize size;

@property (nonatomic, strong) NSArray<CollectionViewSection *> *data;

+ (instancetype)adapterWithSourceData:(NSArray<CollectionViewSection *> *)data;

@end

NS_ASSUME_NONNULL_END
