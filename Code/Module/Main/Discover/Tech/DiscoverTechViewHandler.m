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

@property (nonatomic, strong) UIButton *btnHot, *btnTop;

@end


@implementation DiscoverTechViewHandler

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    self.collectionView = [view findViewByName:@"collection"];
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    
    self.btnHot = [view findViewByName:@"btn_techHot"];
    self.btnTop = [view findViewByName:@"btn_techTop"];
    WeakSelf(self)
    [self.btnHot setClickBlock:^(UIButton * _Nonnull button) {
        [weakself selected:0];
        
    }];
    [self.btnTop setClickBlock:^(UIButton * _Nonnull button) {
        [weakself selected:1];
    }];
    
    [self selected:0];
    
    
    
    return self;
}

- (void)selected:(NSInteger)status {
    self.btnHot.selected = !status;
    self.btnTop.selected = status;
    
    if (self.delegate) {
        [self.delegate onViewAction:@"list_changed" data:@(status)];
    }
}

- (void)setHotData:(id)data {
    
}
- (void)setTopData:(id)data {
    
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
