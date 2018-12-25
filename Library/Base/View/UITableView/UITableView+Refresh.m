//
//  UITableView+Refresh.m
//  APP
//
//  Created by BinGe on 2018/12/25.
//

#import "UITableView+Refresh.h"
#import "KafkaRefresh.h"

@implementation UITableView (Refresh)

- (void)setHeadRefreshHandler:(void(^)(void))block {
    WeakSelf(self)
    [self bindHeadRefreshHandler:^{
        [weakself performSelector:@selector(finishHeadRefresh) withObject:nil afterDelay:1.5];
        block();
    } themeColor:[UIColor grayColor] refreshStyle:KafkaRefreshStyleReplicatorCircle];
}

- (void)setFootRefreshHandler:(void(^)(void))block {
    WeakSelf(self)
    [self bindFootRefreshHandler:^{
        [weakself performSelector:@selector(finishFootRefresh) withObject:nil afterDelay:1.5];
        block();
    } themeColor:[UIColor grayColor] refreshStyle:KafkaRefreshStyleReplicatorCircle];
}

- (void)finishHeadRefresh {
    [self.headRefreshControl endRefreshing];
}

- (void)finishFootRefresh {
    [self.footRefreshControl endRefreshing];
}

@end
