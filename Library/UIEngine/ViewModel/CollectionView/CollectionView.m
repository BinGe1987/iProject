//
//  CollectionView.m
//  APP
//
//  Created by BinGe on 2018/12/27.
//

#import "CollectionView.h"

@implementation CollectionView

- (instancetype)init {
    self = [super initWithFrame:CGRectZero collectionViewLayout:[UICollectionViewLayout new]];
    if (self) {
        self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    return self;
}

@end
