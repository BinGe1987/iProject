//
//  CommentViewHandler.m
//  APP
//
//  Created by BinGe on 2019/1/3.
//

#import "CommentViewHandler.h"
#import "CommentAdapter.h"
#import "Button.h"

@interface CommentViewHandler()

@property (nonatomic, strong) TableViewSection *section;


@end

@implementation CommentViewHandler

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    UITableView *tableView = (UITableView *)[self.view findViewByName:@"table"];
    [tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    TableViewSection *commentSection = [[TableViewSection alloc] initWithDictionary: @{@"name": @"comment", @"array":[NSMutableArray new], @"height" : [NSNumber numberWithFloat:225]}];
    CommentAdapter *adapter = [CommentAdapter AdapterWithSourceData:[NSMutableArray arrayWithObject:commentSection]];
    [tableView setAdapter:adapter];
    self.section = commentSection;
    return self;
}

- (void)setCagetoryData:(id)data {
    ListData *list = data;
    ViewGroup *vg = [self.view findViewByName:@"layout_cagetory"];
    UIButton *button = [vg findViewByName:@"button"];
    if (!list || list.list.count == 0) {
        [button setViewVisibility:ViewVisibilityInvisible];
        return;
    }
    [button setViewVisibility:ViewVisibilityVisible];
    for (int i=0;i<list.list.count;i++) {
        UIButton *btn;
        if (i > 0) {
            btn = [button copy];
            [vg addView:btn];
        } else {
            btn = button;
        }
        CommentCagetoryData *cagetory = list.list[i];
        [btn setTitle:[NSString stringWithFormat:@"%@ %ld", cagetory.name,cagetory.commentCount] forState:UIControlStateNormal];
        WeakSelf(self)
        [btn setClickBlock:^(UIButton * _Nonnull button) {
            [weakself selected:button data:cagetory];
        }];
    }
    button.selected = YES;
    [self selected :button data:list.list[0]];
    [((ViewGroup *)self.view) boundsAndRefreshLayout];
}

- (void)selected:(UIButton *)button data:(id)data {
    ViewGroup *vg = [self.view findViewByName:@"layout_cagetory"];
    for (UIButton *view in vg.subviews) {
        if (view == button) {
            view.selected = YES;
        } else {
            view.selected = NO;
        }
    }
    [self.delegate onViewAction:@"cagetory" data:data];
}

- (void)setData:(id)data {
    UITableView *tableView = (UITableView *)[self.view findViewByName:@"table"];
    CommentListData *detail = (CommentListData *)data;
    
    self.section.array = [detail.list mutableCopy];
    [tableView reloadData];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        //这里 进行 数据操作
        [tableView  scrollRectToVisible:CGRectMake(0, 0, 1, 1) animated:YES];
    });
}

@end
