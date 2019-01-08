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
@property (nonatomic, strong) TableViewSection *section;

@end

@implementation DiscoverClubViewHandler

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    self.tableView = (UITableView *)view;
    
    self.section = [[TableViewSection alloc] initWithDictionary: @{@"name": @"club", @"array": [NSMutableArray new], @"height" : [NSNumber numberWithFloat:106]}];
    DiscoverClubAdapter *adapter = [DiscoverClubAdapter AdapterWithSourceData:[NSMutableArray arrayWithObject:self.section]];
    [self.tableView setAdapter:adapter];
    
    [self.tableView setFootRefreshHandler:^{
    }];
    [self.tableView beginFootRefreshing];
    
    return self;
}

- (void)setData:(id)data {
    DiscoverData *discoverData = (DiscoverData *)data;
    
    self.section.array = [discoverData.club.list mutableCopy];
    [self.tableView reloadData];
    
//    [self.tableView finishHeadRefresh];
    [self.tableView finishFootRefresh];
}

- (void)updateData:(id)data {
    DiscoverData *discoverData = (DiscoverData *)data;
    
    NSArray *old = self.section.array;
    NSMutableArray *new = [discoverData.club.list mutableCopy];
    self.section.array = new;
    
    NSInteger sectionIndex = [self.tableView.adapter sectionIndex:self.section];
    NSMutableArray *indexPaths = [[NSMutableArray alloc] init];
    
    for (NSInteger i=old.count; i<new.count; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:sectionIndex];
        [indexPaths addObject: indexPath];
    }
    
    [self.tableView beginUpdates];
    [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
    [self.tableView endUpdates];
//    [self.tableView reloadData];
    
//    [self.tableView finishHeadRefresh];
    [self.tableView finishFootRefresh];
}

- (void)setRefreshHandler  {
    WeakSelf(self)
    [self.tableView setHeadRefreshHandler:^{
        [weakself.tableView performSelector:@selector(finishHeadRefresh) withObject:nil afterDelay:1];
        if (weakself.delegate) {
            [weakself.delegate onViewAction:@"action_refresh_head" data:nil];
        }
    }];
    [self.tableView setFootRefreshHandler:^{
        if (weakself.delegate) {
            [weakself.delegate onViewAction:@"action_refresh_foot" data:nil];
        }
    }];
}

@end
