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

@property (nonatomic, assign) BOOL refresh;

@end

@implementation HomeViewHandler

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    self.tableView = (UITableView *)view;
    [self.tableView setAdapter:[HomeViewAdpater new]];
    
    self.bannerSection = [[TableViewSection alloc] initWithDictionary: @{@"name": @"banner", @"array": @[], @"height" : [NSNumber numberWithFloat:ScaleValue(138)]}];
    
    self.classifySection = [[TableViewSection alloc] initWithDictionary: @{@"name": @"classify", @"array": @[], @"height" : [NSNumber numberWithFloat:ScaleValue(75)]}];
    
    self.techSection = [[TableViewSection alloc] initWithDictionary: @{@"name": @"tech", @"array": @[],@"headerHeight": [NSNumber numberWithFloat:ScaleValue(43)], @"height" : [NSNumber numberWithFloat:ScaleValue(100)]}];
    
    self.clubSection = [[TableViewSection alloc] initWithDictionary: @{@"name": @"club", @"array": @[],@"headerHeight": [NSNumber numberWithFloat:ScaleValue(43)], @"height" : [NSNumber numberWithFloat:106]}];
    
    
    [self.tableView setFootRefreshHandler:^{
    }];
    [self.tableView beginFootRefreshing];
    return self;
}

- (void)startLoading {
//    [self.tableView beginFootRefreshing];
}

- (void)setAdapter {
    
}


- (void)setData:(id)data {
    HomeData *homeData = (HomeData *)data;
    [self.tableView.adapter addSection:self.bannerSection];
    self.bannerSection.array = [@[homeData.banner] mutableCopy];
    
    [self.tableView.adapter addSection:self.classifySection];
    self.classifySection.array = [@[homeData.classify] mutableCopy];
    
    [self.tableView reloadData];
}

- (void)setTechData:(NSArray *)techData {
    self.techSection.array = [NSMutableArray arrayWithObject:techData];
    if (techData && techData.count > 0) {
        [self.tableView.adapter addSection:self.techSection index:2];
    } else {
        [self.tableView.adapter removeSection:self.techSection];
    }
    [self.tableView reloadData];
}



- (void)setClubData:(NSArray *)clubData {
    [self.tableView.adapter addSection:self.clubSection];
    self.clubSection.array = [clubData mutableCopy];
    [self.tableView reloadData];
    [self.tableView finishFootRefresh];
    [self.tableView resetFootRefresh];
    
    if (!self.refresh) {
        self.refresh = YES;
        WeakSelf(self)
        [self.tableView setHeadRefreshHandler:^{
            [weakself.tableView performSelector:@selector(finishHeadRefresh) withObject:nil afterDelay:2];
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
}

- (void)insertClubData:(NSArray *)data {
    [self.tableView finishFootRefresh];
    if (data && data.count == 0) {
//        [self.tableView finishFootRefreshWithText:@"敬请期待。"];
        return;
    }
    
    NSArray *old = [self.clubSection.array mutableCopy];
    [self.clubSection.array addObjectsFromArray:data];
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
}

@end
