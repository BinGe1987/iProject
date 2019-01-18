//
//  UITableView+AutoAdapter.m
//  APP
//
//  Created by BinGe on 2019/1/15.
//

#import "UITableView+Section.h"
#import "AutoTableViewAdapter.h"

@interface UITableView ()

@property (nonatomic, strong) AutoTableViewAdapter *adapter;

@end

@implementation UITableView (Section)

- (void)addSection:(AutoTableViewSection *)section {
    self.separatorStyle = UITableViewCellSelectionStyleNone;
    if (!self.adapter) {
        self.adapter = [AutoTableViewAdapter adapterWithSection:section];
    } else {
        [self.adapter addSection:section];
    }
}

static const void *AdapterKey = &AdapterKey;
- (void)setAdapter:(AutoTableViewAdapter *)adapter {
    objc_setAssociatedObject(self, AdapterKey, adapter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.delegate = adapter;
    self.dataSource = adapter;
    [self reloadData];
}

- (AutoTableViewAdapter *)adapter {
    return objc_getAssociatedObject(self, AdapterKey);
}

@end
