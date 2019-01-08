//
//  DiscoverClubViewHandler.m
//  APP
//
//  Created by BinGe on 2018/12/27.
//

#import "DiscoverClubViewHandler.h"
#import "DiscoverClubAdapter.h"

@interface DiscoverClubViewHandler()

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation DiscoverClubViewHandler

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    self.tableView = (UITableView *)view;
    
    [self.tableView setFootRefreshHandler:^{
    }];
    [self.tableView beginFootRefreshing];
    
    return self;
}

- (void)setData:(id)data {
    DiscoverData *discoverData = (DiscoverData *)data;
    TableViewSection *clubSection = [[TableViewSection alloc] initWithDictionary: @{@"name": @"club", @"array": discoverData.club.list, @"height" : [NSNumber numberWithFloat:106]}];
    DiscoverClubAdapter *adapter = [DiscoverClubAdapter AdapterWithSourceData:[NSMutableArray arrayWithObject:clubSection]];
    [self.tableView setAdapter:adapter];
}

@end
