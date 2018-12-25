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
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    WeakSelf(self)
    [self.tableView setHeadRefreshHandler:^{
        if (weakself.delegate) {
            [weakself.delegate onViewAction:@"action_refresh_head"];
        }
    }];
    [self.tableView setFootRefreshHandler:^{
        if (weakself.delegate) {
            [weakself.delegate onViewAction:@"action_refresh_foot"];
        }
    }];
    return self;
}

- (void)setData:(id)data {
    HomeData *homeData = (HomeData *)data;
    TableViewSection *bannerSection = [[TableViewSection alloc] initWithDictionary: @{@"name": @"banner", @"array": @[homeData.banner], @"height" : [NSNumber numberWithFloat:ScaleValue(138)]}];
    HomeViewAdpater *adapter = [HomeViewAdpater AdapterWithSourceData:@[bannerSection]];
    [self.tableView setAdapter:adapter];
}

@end
