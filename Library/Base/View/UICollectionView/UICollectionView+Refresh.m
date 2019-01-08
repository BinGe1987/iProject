//
//  UICollectionView+Refresh.m
//  APP
//
//  Created by BinGe on 2019/1/8.
//

#import "UICollectionView+Refresh.h"
#import "KafkaRefresh.h"

@implementation UICollectionView (Refresh)

- (void)setHeadRefreshHandler:(void(^)(void))block {
    [self bindGlobalStyleForFootRefreshHandler:nil];
    [self bindHeadRefreshHandler:block themeColor:UIColorMain refreshStyle:KafkaRefreshStyleReplicatorCircle];
}
- (void)beginHeadRefreshing {
    [self.headRefreshControl beginRefreshing];
}

- (void)setFootRefreshHandler:(void(^)(void))block {
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
    //    [self.footRefreshControl endRefreshingWithAlertText:text completion:nil];
    [self.footRefreshControl endRefreshingAndNoLongerRefreshingWithAlertText:text];
    //    [self.footRefreshControl resumeRefreshAvailable];
}

- (void)resetFootRefresh {
    [self.footRefreshControl resumeRefreshAvailable];
}

@end
