//
//  HomeViewHandler.m
//  APP
//
//  Created by BinGe on 2018/12/25.
//

#import "HomeViewHandler.h"
#import "HomeViewAdpater.h"

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
    
//    [self setAdapter];
    WeakSelf(self)
    [self.tableView setHeadRefreshHandler:^{
        if (weakself.delegate) {
//            [weakself.delegate onViewAction:@"action_refresh_head"];
        }
    }];
    [self.tableView setFootRefreshHandler:^{
        if (weakself.delegate) {
//            [weakself.delegate onViewAction:@"action_refresh_foot"];
        }
    }];
    return self;
}

- (void)setAdapter {
    
}

- (void)setData:(id)data {
    HomeData *homeData = (HomeData *)data;
    self.bannerSection.array = @[homeData.banner];
    self.classifySection.array = @[homeData.classify];
    self.techSection.array = @[homeData.tech];
    if (homeData.tech && homeData.tech.count > 0) {
        [self.tableView.adapter addSection:self.techSection index:2];
    } else {
        [self.tableView.adapter removeSection:self.techSection];
    }
    
    [self.tableView reloadData];
}

@end
