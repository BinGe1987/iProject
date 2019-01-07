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
//    WeakSelf(self)
//    [self bindHeadRefreshHandler:^{
//        [weakself performSelector:@selector(finishHeadRefresh) withObject:nil afterDelay:1.5];
//        block();
//    } themeColor:UIColorMain refreshStyle:KafkaRefreshStyleReplicatorCircle];
    [self bindHeadRefreshHandler:block themeColor:UIColorMain refreshStyle:KafkaRefreshStyleReplicatorCircle];
}
- (void)beginHeadRefreshing {
    [self.headRefreshControl beginRefreshing];
}

- (void)setFootRefreshHandler:(void(^)(void))block {
//    WeakSelf(self)
//    [self bindFootRefreshHandler:^{
//        [weakself performSelector:@selector(finishFootRefresh) withObject:nil afterDelay:1.5];
//        block();
//    } themeColor:UIColorMain refreshStyle:KafkaRefreshStyleReplicatorCircle];
    [self bindFootRefreshHandler:block themeColor:UIColorMain refreshStyle:KafkaRefreshStyleReplicatorCircle];
}

- (void)beginFootRefreshing {
    [self.footRefreshControl beginRefreshing];
}

- (void)finishHeadRefresh {
    [self.headRefreshControl endRefreshing];
}

- (void)finishFootRefresh {
    [self.footRefreshControl endRefreshing];
}
- (void)finishFootRefreshWithText:(NSString *)text {
    [self.footRefreshControl endRefreshingAndNoLongerRefreshingWithAlertText:text];
}

@end
