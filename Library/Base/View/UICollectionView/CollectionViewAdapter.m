//
//  CollectionViewAdapter.m
//  APP
//
//  Created by BinGe on 2018/12/27.
//

#import "CollectionViewAdapter.h"

@implementation CollectionViewAdapter


+ (instancetype)adapterWithSourceData:(NSArray<CollectionViewSection *> *)data {
    CollectionViewAdapter *adapter = [[[self class] alloc] init];
    adapter.data = data;
    return  adapter;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.data.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    CollectionViewSection *cSection = [self.data objectAtIndex:section];
    return [cSection.array count];
}

- (NSInteger)sectionIndex:(CollectionViewSection *)section {
    return [self.data indexOfObject:section];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    CollectionViewSection *cSection = [self.data objectAtIndex:section];
    CGSize size = cSection.itemSize;
    CGFloat width = collectionView.frame.size.width;
    int colume = width / size.width;
    CGFloat padding = (width - size.width * colume) / (colume + 1);
    return UIEdgeInsetsMake(padding, padding, padding, padding);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    CollectionViewSection *cSection = [self.data objectAtIndex:section];
    CGSize size = cSection.itemSize;
    CGFloat width = collectionView.frame.size.width;
    int colume = width / size.width;
    CGFloat padding = (width - size.width * colume) / (colume + 1);
    return padding;
}

@end
