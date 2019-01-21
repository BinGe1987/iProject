//
//  MyFollowTechViewHandler.m
//  APP
//
//  Created by BinGe on 2019/1/17.
//

#import "MyFollowTechViewHandler.h"
#import "MyFollowTechCell.h"

@interface MyFollowTechViewHandler()

@property (nonatomic, strong) UITableView *table;
@property (nonatomic, strong) AutoTableViewSection *section;

@end

@implementation MyFollowTechViewHandler

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    self.section = [AutoTableViewSection sectionWithCellClass:[MyFollowTechCell class] dataSource:@[]];
    self.table = [view findViewByName:@"table"];
    [self.table addSection:self.section];
    WeakSelf(self)
    [self.table setHeadRefreshHandler:^{
        [weakself.delegate onViewAction:@"action_refresh" data:nil];
    }];
    [self.table beginHeadRefreshing];
    return self;
}

- (void)setTechList:(ListData *)list {
    [self.table performSelector:@selector(finishHeadRefresh) withObject:nil afterDelay:0.8];
    self.section.dataArray = [list.list mutableCopy];
    [self.table reloadData];
}

@end
