//
//  HomeViewHandler.h
//  APP
//
//  Created by BinGe on 2018/12/25.
//

#import "ViewHandler.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeViewHandler : ViewHandler

///首页刚打开的时候会显示loading动画
- (void)startLoading;
///banner和分类
- (void)setData:(id)data;
///技师数据
- (void)setTechData:(NSArray *)techData;
///商家数据
- (void)setClubData:(NSArray *)clubData;
///从尾部插入商家数据
- (void)insertClubData:(NSArray *)clubData;

@end

NS_ASSUME_NONNULL_END
