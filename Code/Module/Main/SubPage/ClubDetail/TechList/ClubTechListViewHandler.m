//
//  ClubTechListViewHandler.m
//  APP
//
//  Created by BinGe on 2019/1/13.
//

#import "ClubTechListViewHandler.h"
#import "ClubTechListAdapter.h"

@interface ClubTechListViewHandler()

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ClubTechListViewHandler

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    self.tableView = [view findViewByName:@"table"];
    return self;
}

- (void)setData:(id)data {
    
    ListData *listData = data;
    TableViewSection *techSection = [[TableViewSection alloc] initWithDictionary: @{@"name": @"tech", @"array": listData.list, @"height" : @(ScaleValue(78))}];
    
    ClubTechListAdapter *adapter = [ClubTechListAdapter AdapterWithSourceData:[@[techSection] mutableCopy]];
    [self.tableView setAdapter:adapter];
    [self.tableView reloadData];
}

@end
