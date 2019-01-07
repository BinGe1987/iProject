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

@end

@implementation HomeViewHandler

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    self.tableView = (UITableView *)view;
    [self.tableView setAdapter:[HomeViewAdpater new]];
    
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
    TableViewSection *bannerSection = [[TableViewSection alloc] initWithDictionary: @{@"name": @"banner", @"array": @[homeData.banner], @"height" : [NSNumber numberWithFloat:ScaleValue(138)]}];
//    TableViewSection *classifySection = [[TableViewSection alloc] initWithDictionary: @{@"name": @"classify", @"array": @[homeData.classify], @"height" : [NSNumber numberWithFloat:ScaleValue(75)]}];
//    TableViewSection *techSection = [[TableViewSection alloc] initWithDictionary: @{@"name": @"tech", @"array": @[homeData.tech],@"headerHeight": [NSNumber numberWithFloat:ScaleValue(43)], @"height" : [NSNumber numberWithFloat:ScaleValue(100)]}];
//    TableViewSection *clubSection = [[TableViewSection alloc] initWithDictionary: @{@"name": @"club", @"array": homeData.club,@"headerHeight": [NSNumber numberWithFloat:ScaleValue(28)], @"height" : [NSNumber numberWithFloat:106]}];
//    HomeViewAdpater *adapter = [HomeViewAdpater AdapterWithSourceData:@[bannerSection, classifySection, techSection, clubSection]];
    [self.tableView.adapter addSection:bannerSection];
    [self.tableView reloadData];
}

@end
