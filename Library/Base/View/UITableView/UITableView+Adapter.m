//
//  UITableView+Adapter.m
//  APP
//
//  Created by BinGe on 2018/12/25.
//

#import "UITableView+Adapter.h"

static const void *AdapterKey = &AdapterKey;

@implementation UITableView (Adapter)

- (void)setAdapter:(TableViewAdapter *)adapter {
    objc_setAssociatedObject(self, AdapterKey, adapter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.delegate = adapter;
    self.dataSource = adapter;
    [self reloadData];
}

- (TableViewAdapter *)adapter {
    return objc_getAssociatedObject(self, AdapterKey);
}

@end
