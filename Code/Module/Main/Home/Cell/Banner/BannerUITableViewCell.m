//
//  BannerUITableViewCell.m
//  APP
//
//  Created by BinGe on 2018/12/25.
//

#import "BannerUITableViewCell.h"
#import "BannerView.h"

@interface BannerUITableViewCell()

@property (nonatomic, strong) BannerView *bannerView;

@end

@implementation BannerUITableViewCell

+ (instancetype)tableView:(UITableView *)tableView cellWithSize:(CGSize)size {
    static NSString *identifier = @"TableViewAdapterCell_Banner";
    BannerUITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil){
        cell = [[BannerUITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        [cell initWithSize:size];
    }
    return cell;
}

- (void)initWithSize:(CGSize)size {
    self.bannerView = [[BannerView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    [self.contentView addSubview:self.bannerView];
}

- (void)setData:(id)data {
    if (self.cellData == data) {
        return;
    }
    self.cellData = data;
    NSMutableArray *array = [NSMutableArray new];
    for (BannerData *banner in data) {
//        UIImage *image = [UIImage imageWithContentsOfFile:imageUrl];
        [array addObject:banner.imageUrl];
    }
    [self.bannerView setImages:array];
}

@end
