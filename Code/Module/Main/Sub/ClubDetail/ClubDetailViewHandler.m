//
//  ClubDetailViewHandler.m
//  APP
//
//  Created by BinGe on 2019/1/2.
//

#import "ClubDetailViewHandler.h"
#import "ClubDetailAdapter.h"

@interface ClubDetailViewHandler()

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ClubDetailViewHandler

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    self.tableView = (UITableView *)view;
    self.tableView.showsVerticalScrollIndicator = FALSE; //垂直滚动条
    self.tableView.showsHorizontalScrollIndicator = FALSE;//水平滚动条
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.tableView setHeadRefreshHandler:^{
    }];
    return self;
}

- (void)setData:(id)data {
    ClubDetailData *detailData = (ClubDetailData *)data;
    TableViewSection *bannerSection = [[TableViewSection alloc] initWithDictionary: @{@"name": @"banner", @"array": @[detailData.bannerList.list], @"height" : [NSNumber numberWithFloat:ScaleValue(138)]}];
    TableViewSection *profileSection = [[TableViewSection alloc] initWithDictionary: @{@"name": @"profile", @"array": @[detailData.clubData], @"height" : [NSNumber numberWithFloat:125]}];
//    TableViewSection *techSection = [[TableViewSection alloc] initWithDictionary: @{@"name": @"tech", @"array": @[homeData.tech],@"headerHeight": [NSNumber numberWithFloat:ScaleValue(43)], @"height" : [NSNumber numberWithFloat:ScaleValue(100)]}];
//    TableViewSection *clubSection = [[TableViewSection alloc] initWithDictionary: @{@"name": @"club", @"array": homeData.club,@"headerHeight": [NSNumber numberWithFloat:ScaleValue(28)], @"height" : [NSNumber numberWithFloat:106]}];
    ClubDetailAdapter *adapter = [ClubDetailAdapter AdapterWithSourceData:@[bannerSection,profileSection]];
    [self.tableView setAdapter:adapter];
}

@end
