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
    TableViewSection *adSection = [[TableViewSection alloc] initWithDictionary: @{@"name": @"ad", @"array": @[@""], @"height" : [NSNumber numberWithFloat:ScaleValue(31)]}];
    TableViewSection *techSection = [[TableViewSection alloc] initWithDictionary: @{@"name": @"tech", @"array": @[detailData.techList.list], @"height" : [NSNumber numberWithFloat:157]}];
    TableViewSection *projectSection = [[TableViewSection alloc] initWithDictionary: @{@"name": @"project", @"array": @[detailData.projectList.list], @"height" : [NSNumber numberWithFloat:312]}];
    TableViewSection *commentSection = [[TableViewSection alloc] initWithDictionary: @{@"name": @"comment", @"array": @[detailData.commentList.list], @"height" : [NSNumber numberWithFloat:286]}];
    ClubDetailAdapter *adapter = [ClubDetailAdapter AdapterWithSourceData:@[bannerSection,profileSection,adSection,techSection,projectSection,commentSection]];
    [self.tableView setAdapter:adapter];
}

@end
