//
//  HomeViewHandler.m
//  APP
//
//  Created by BinGe on 2018/12/25.
//

#import "HomeViewHandler.h"
#import "HomeViewAdpater.h"
//#import "KafkaRefresh.h"

@interface HomeViewHandler()

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) TableViewSection *bannerSection;
@property (nonatomic, strong) TableViewSection *classifySection;
@property (nonatomic, strong) TableViewSection *techSection;
@property (nonatomic, strong) TableViewSection *clubSection;

@end

@implementation HomeViewHandler

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    self.tableView = (UITableView *)view;
    [self.tableView setAdapter:[HomeViewAdpater new]];
    
    self.bannerSection = [[TableViewSection alloc] initWithDictionary: @{@"name": @"banner", @"array": @[], @"height" : [NSNumber numberWithFloat:ScaleValue(138)]}];
    [self.tableView.adapter addSection:self.bannerSection];
    self.classifySection = [[TableViewSection alloc] initWithDictionary: @{@"name": @"classify", @"array": @[], @"height" : [NSNumber numberWithFloat:ScaleValue(75)]}];
    [self.tableView.adapter addSection:self.classifySection];
    self.techSection = [[TableViewSection alloc] initWithDictionary: @{@"name": @"tech", @"array": @[],@"headerHeight": [NSNumber numberWithFloat:ScaleValue(43)], @"height" : [NSNumber numberWithFloat:ScaleValue(100)]}];
    [self.tableView.adapter addSection:self.techSection];
    self.clubSection = [[TableViewSection alloc] initWithDictionary: @{@"name": @"club", @"array": @[],@"headerHeight": [NSNumber numberWithFloat:ScaleValue(43)], @"height" : [NSNumber numberWithFloat:106]}];
    [self.tableView.adapter addSection:self.clubSection];
    
    WeakSelf(self)
    [self.tableView setHeadRefreshHandler:^{
        if (weakself.delegate) {
//            [weakself.delegate onViewAction:@"action_refresh_head"];
        }
    }];
    [self.tableView setFootRefreshHandler:^{
        if (weakself.delegate) {
            [weakself.delegate onViewAction:@"action_refresh_foot" data:nil];
        }
    }];
    [self.tableView beginFootRefreshing];
//    self.tableView nolon
//    [self.tableView.footRefreshControl endRefreshingAndNoLongerRefreshingWithAlertText:@"no more"];
    return self;
}

- (void)setAdapter {
    
}

- (void)setData:(id)data {
    HomeData *homeData = (HomeData *)data;
    self.bannerSection.array = [@[homeData.banner] mutableCopy];
    self.classifySection.array = [@[homeData.classify] mutableCopy];
    self.techSection.array = [@[homeData.tech] mutableCopy];
    if (homeData.tech && homeData.tech.count > 0) {
        [self.tableView.adapter addSection:self.techSection index:2];
    } else {
        [self.tableView.adapter removeSection:self.techSection];
    }
    [self.tableView reloadData];
}

- (void)setClubData:(NSArray *)clubData {
    self.clubSection.array = [clubData mutableCopy];
    [self.tableView reloadData];
    [self.tableView finishFootRefresh];
}

- (void)insertClubData:(NSArray *)data {
    
    if (data || data.count == 0) {
        [self.tableView finishFootRefreshWithText:@"没有更多了!"];
        return;
    }
    
    NSArray *old = [self.clubSection.array mutableCopy];
    [self.clubSection.array addObjectsFromArray:data];
    
    
    [self.tableView finishFootRefresh];
    
    NSInteger row = old.count;
    NSInteger sectionIndex = [self.tableView.adapter sectionIndex:self.clubSection];
    NSMutableArray *indexPaths = [[NSMutableArray alloc] init];
    for (NSInteger i=0; i<data.count; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row+i inSection:sectionIndex];
        [indexPaths addObject: indexPath];
    }
    
    [self.tableView beginUpdates];
    [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
    [self.tableView endUpdates];
    [self.tableView finishFootRefresh];
}

@end
