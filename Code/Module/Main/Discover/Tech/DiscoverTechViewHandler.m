//
//  DiscoverTechViewHandler.m
//  APP
//
//  Created by BinGe on 2018/12/27.
//

#import "DiscoverTechViewHandler.h"
#import "DiscoverTechAdapter.h"

@interface DiscoverTechViewHandler()

@property (nonatomic, strong) UICollectionView *collectionView;

@end


@implementation DiscoverTechViewHandler

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    self.collectionView = (UICollectionView *)view;
    
    return self;
}

- (void)setData:(id)data {
    DiscoverData *discoverData = (DiscoverData *)data;
    
    CollectionViewSection *section = [CollectionViewSection new];
    section.itemSize = CGSizeMake(ScaleValue(164), ScaleValue(164));
    section.array = discoverData.tech.list;
    
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.itemSize = section.itemSize;
    self.collectionView.collectionViewLayout = layout;
    
    DiscoverTechAdapter *adapter = [DiscoverTechAdapter collectionView:self.collectionView adapterWithSourceData:@[section]];
    [self.collectionView setAdapter:adapter];
}

@end
