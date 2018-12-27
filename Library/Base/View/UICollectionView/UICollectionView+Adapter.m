//
//  UICollectionView+Adapter.m
//  APP
//
//  Created by BinGe on 2018/12/27.
//

#import "UICollectionView+Adapter.h"

static const void *AdapterKey = &AdapterKey;

@implementation UICollectionView (Adapter)

- (void)setAdapter:(CollectionViewAdapter *)adapter {
    objc_setAssociatedObject(self, AdapterKey, adapter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.delegate = adapter;
    self.dataSource = adapter;
    
    [self registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellId];
    [self registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerId];
    [self registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:footerId];
    
    [self reloadData];
}

- (CollectionViewAdapter *)adapter {
    return objc_getAssociatedObject(self, AdapterKey);
}

@end
