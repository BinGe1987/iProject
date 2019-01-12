//
//  SearchResultViewHandler.m
//  APP
//
//  Created by BinGe on 2019/1/12.
//

#import "SearchResultViewHandler.h"
#import "SearchResultAdapter.h"

@interface SearchResultViewHandler()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) TableViewSection *section;

@end

@implementation SearchResultViewHandler

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    
    self.tableView = (UITableView *)view;
    
    self.section = [[TableViewSection alloc] initWithDictionary: @{@"name": @"club", @"array": [NSMutableArray new], @"height" : [NSNumber numberWithFloat:106]}];
    SearchResultAdapter *adapter = [SearchResultAdapter AdapterWithSourceData:[NSMutableArray arrayWithObject:self.section]];
    [self.tableView setAdapter:adapter];
    
    return self;
}

- (void)show:(BOOL)show {
    [self.view setViewVisibility: show ? ViewVisibilityVisible : ViewVisibilityInvisible];
}

- (void)setData:(id)data {
    ListData *list = data;
    if ([data isKindOfClass:[ListData class]] && list.list.count > 0) {
        [self showSearchList:list];
    } else {
        [self showEmpty];
    }
}

- (void)showEmpty {
    
}

- (void)showSearchList:(ListData *)listData {
    self.section.array = [listData.list mutableCopy];
    [self.tableView reloadData];
}

@end
