//
//  DiscoverTechViewHandler.m
//  APP
//
//  Created by BinGe on 2018/12/27.
//

#import "DiscoverTechViewHandler.h"

@interface DiscoverTechViewHandler()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

static NSString *const cellId = @"cellId";
static NSString *const headerId = @"headerId";
static NSString *const footerId = @"footerId";

@implementation DiscoverTechViewHandler

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    self.collectionView = (UICollectionView *)view;
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.itemSize = CGSizeMake(ScaleValue(164), ScaleValue(164));
    self.collectionView.collectionViewLayout = layout;
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellId];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerId];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:footerId];
    
    return self;
}

- (void)setData:(id)data {
    DiscoverData *discoverData = (DiscoverData *)data;
    TableViewSection *clubSection = [[TableViewSection alloc] initWithDictionary: @{@"name": @"club", @"array": discoverData.tech.list, @"height" : [NSNumber numberWithFloat:106]}];
//    DiscoverClubAdapter *adapter = [DiscoverClubAdapter AdapterWithSourceData:@[clubSection]];
//    [self.tableView setAdapter:adapter];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 30;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    
    return cell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)collectionViewLayout;
    CGSize size = layout.itemSize;
    CGFloat width = collectionView.frame.size.width;
    int colume = width / size.width;
    CGFloat padding = (width - size.width * colume) / (colume + 1);
    return UIEdgeInsetsMake(15, padding, 15, padding);
}

@end
