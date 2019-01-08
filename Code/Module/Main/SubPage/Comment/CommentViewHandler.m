//
//  CommentViewHandler.m
//  APP
//
//  Created by BinGe on 2019/1/3.
//

#import "CommentViewHandler.h"
#import "CommentAdapter.h"

@implementation CommentViewHandler

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    UITableView *tableView = (UITableView *)[self.view findViewByName:@"table"];
    [tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
//    [tableView setSeparatorInset:UIEdgeInsetsMake(0, 85, 0, 15)];
    return self;
}

- (void)setData:(id)data {
    UITableView *tableView = (UITableView *)[self.view findViewByName:@"table"];
    
    CommentListData *detail = (CommentListData *)data;
    TableViewSection *commentSection = [[TableViewSection alloc] initWithDictionary: @{@"name": @"comment", @"array": detail.list, @"height" : [NSNumber numberWithFloat:225]}];
    CommentAdapter *adapter = [CommentAdapter AdapterWithSourceData:[NSMutableArray arrayWithObject:commentSection]];
    [tableView setAdapter:adapter];
}

@end
