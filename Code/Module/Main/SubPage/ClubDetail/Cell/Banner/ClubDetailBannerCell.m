//
//  ClubDetailBannerCell.m
//  APP
//
//  Created by BinGe on 2019/1/2.
//

#import "ClubDetailBannerCell.h"
#import "BannerView.h"

@interface ClubDetailBannerCell()

@property (nonatomic, strong) BannerView *bannerView;
@property (nonatomic, strong) ListData *bannerList;

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
    [self.contentView addSubview:self.bannerView];
}

- (void)setData:(id)data {
    NSMutableArray *array = [NSMutableArray new];
    for (BannerData *banner in data) {
        [array addObject:banner.imageUrl];
    }
    [self.bannerView setImages:array];
}

@end
