//
//  ClubDetailBannerCell.m
//  APP
//
//  Created by BinGe on 2019/1/2.
//

#import "ClubDetailBannerCell.h"
#import "BannerView.h"

@interface ClubDetailBannerCell()<BannerViewDelegate, PhotoBrowserDelegate>

@property (nonatomic, strong) BannerView *bannerView;
@property (nonatomic, strong) PhotoBrowser *browser;
@property (nonatomic, strong) NSArray *bannerList;

@end

@implementation ClubDetailBannerCell

+ (instancetype)tableView:(UITableView *)tableView cellWithSize:(CGSize)size {
    static NSString *identifier = @"TableViewAdapterClubDetailCell_Banner";
    ClubDetailBannerCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil){
        cell = [[ClubDetailBannerCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        [cell initWithSize:size];
    }
    return cell;
}

- (void)initWithSize:(CGSize)size {
    self.bannerView = [[BannerView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    self.bannerView.delegate = self;
    [self.contentView addSubview:self.bannerView];
}

- (void)setData:(id)data {
    self.bannerList = [data mutableCopy];
    NSMutableArray *array = [NSMutableArray new];
    for (BannerData *banner in data) {
        [array addObject:banner.imageUrl];
    }
    [self.bannerView setImages:array];
}

- (void)bannerView:(BannerView *)bannerView selectedIndex:(NSInteger)selected {
    NSMutableArray<PhotoItem *> *array = [NSMutableArray new];
    NSArray *items = [bannerView getBannerItems];
    for (int i=0;i<items.count;i++) {
        BannerItem *item = items[i];
        [array addObject:[[PhotoItem alloc] initWithView:item.view imageUrl:item.url]];
    }
    if (!self.browser) {
        self.browser = [PhotoBrowser new];
    }
    [self.browser browserPhotoItems:array selectedIndex:selected delegate:self];
}

- (void)photoBrowser:(PhotoBrowser *)browser didSelectItem:(PhotoItem *)item atIndex:(NSUInteger)index {
    UIImageView *view = item.view;
    if (view) {
        [self.bannerView scrollToView:view];
    }
}

@end
