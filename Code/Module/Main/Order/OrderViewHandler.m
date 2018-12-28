//
//  OrderViewHandler.m
//  APP
//
//  Created by BinGe on 2018/12/28.
//

#import "OrderViewHandler.h"
#import "OrderTableViewAdapter.h"

@interface OrderViewHandler()

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation OrderViewHandler

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    self.tableView = (UITableView *)view;
    self.tableView.showsVerticalScrollIndicator = FALSE; //垂直滚动条
    self.tableView.showsHorizontalScrollIndicator = FALSE;//水平滚动条
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

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

- (void)setData:(id)data {
    ListData *list = (ListData *)data;
    TableViewSection *orderSection = [[TableViewSection alloc] initWithDictionary: @{@"name": @"order", @"array": list.list, @"height" : [NSNumber numberWithFloat:(ScaleValue(217) + 10)], @"headerHeight": @"5",@"footerHeight": @"10"}];
    OrderTableViewAdapter *adapter = [OrderTableViewAdapter AdapterWithSourceData:@[orderSection]];
    [self.tableView setAdapter:adapter];
}

@end
