//
//  UITableView+Refresh.h
//  APP
//
//  Created by BinGe on 2018/12/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (Refresh)

- (void)setHeadRefreshHandler:(void(^)(void))block;
- (void)beginHeadRefreshing;

- (void)setFootRefreshHandler:(void(^)(void))block;
- (void)beginFootRefreshing;


- (void)finishHeadRefresh;

- (void)finishFootRefresh;
- (void)finishFootRefreshWithText:(NSString *)text;
- (void)resetFootRefresh;

@end

NS_ASSUME_NONNULL_END
