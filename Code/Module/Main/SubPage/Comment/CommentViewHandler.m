//
//  CommentViewHandler.m
//  APP
//
//  Created by BinGe on 2019/1/3.
//

#import "CommentViewHandler.h"
#import "CommentAdapter.h"
#import "Button.h"

@implementation CommentViewHandler

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    UITableView *tableView = (UITableView *)[self.view findViewByName:@"table"];
    [tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
//    [tableView setSeparatorInset:UIEdgeInsetsMake(0, 85, 0, 15)];
    return self;
}

- (void)setCagetoryData:(id)data {
    ViewGroup *vg = [self.view findViewByName:@"layout_cagetory"];
    
    UIButton *button = [vg findViewByName:@"button"];
//    UIButton *button2 = [button copy];
//    [vg addView:button2];
//    
//    for (CommentCagetoryData *cagetory in ((ListData *)data).list) {
//        
//    }
//    [((ViewGroup *)self.view) boundsAndRefreshLayout];
}

- (void)setData:(id)data {
    UITableView *tableView = (UITableView *)[self.view findViewByName:@"table"];
    
    CommentListData *detail = (CommentListData *)data;
    TableViewSection *commentSection = [[TableViewSection alloc] initWithDictionary: @{@"name": @"comment", @"array": detail.list, @"height" : [NSNumber numberWithFloat:225]}];
    CommentAdapter *adapter = [CommentAdapter AdapterWithSourceData:[NSMutableArray arrayWithObject:commentSection]];
    [tableView setAdapter:adapter];
}

@end
