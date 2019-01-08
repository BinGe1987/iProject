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
@property (nonatomic, strong) CollectionViewSection *section;

@property (nonatomic, strong) UIButton *btnHot, *btnTop;

@end


@implementation DiscoverTechViewHandler

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    self.collectionView = [view findViewByName:@"collection"];
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.alwaysBounceVertical = YES;
    
    CollectionViewSection *section = [CollectionViewSection new];
    section.itemSize = CGSizeMake(ScaleValue(164), ScaleValue(164));
    section.array = [NSMutableArray new];
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.itemSize = section.itemSize;
    self.collectionView.collectionViewLayout = layout;
    self.section = section;
    DiscoverTechAdapter *adapter = [DiscoverTechAdapter collectionView:self.collectionView adapterWithSourceData:@[section]];
    [self.collectionView setAdapter:adapter];
    
    
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
    
//    self.section.array = @[];
//    [self.collectionView reloadData];
    
    if (self.delegate) {
        [self.delegate onViewAction:@"list_changed" data:@(status)];
    }
    
//    self.collectionView.contentOffset = CGPointMake(0, -(STATUSBARHIEGHT+44));
}

- (void)setRefreshHandler {
    WeakSelf(self)
    [self.collectionView setHeadRefreshHandler:^{
        [weakself.collectionView performSelector:@selector(finishHeadRefresh) withObject:nil afterDelay:1];
        if (weakself.delegate) {
            [weakself.delegate onViewAction:@"action_refresh_head" data:nil];
        }
    }];
    [self.collectionView setFootRefreshHandler:^{
        if (weakself.delegate) {
            [weakself.delegate onViewAction:@"action_refresh_foot" data:nil];
        }
    }];
}

- (void)setData:(id)data {
    DiscoverData *discoverData = (DiscoverData *)data;
    self.section.array = discoverData.tech.list;
    [self.collectionView reloadData];
    
    [self.collectionView finishFootRefresh];
    
}

@end
