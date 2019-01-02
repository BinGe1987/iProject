//
//  DiscoverTechAdapter.m
//  APP
//
//  Created by BinGe on 2018/12/27.
//

#import "DiscoverTechAdapter.h"
#import "DiscoverTechCell.h"

@implementation DiscoverTechAdapter


static NSString *identifier = @"DiscoverTechAdapter_Cell";

+ (instancetype)collectionView:collection adapterWithSourceData:(NSArray<CollectionViewSection *> *)data {
    
    [collection registerClass:[DiscoverTechCell class] forCellWithReuseIdentifier:identifier];
    [collection registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerId];
    [collection registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:footerId];
    
    DiscoverTechAdapter *adapter = [[[self class] alloc] init];
    adapter.data = data;
    return adapter;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DiscoverTechCell *cell = (DiscoverTechCell *)[collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    CollectionViewSection *data = [self.data objectAtIndex:indexPath.section];
    [cell setData:[data.array objectAtIndex:indexPath.row]];
//    cell.backgroundColor = [UIColor redColor];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [UIViewController pushController:@"TechDetailController" animated:YES data:nil];
}

@end
