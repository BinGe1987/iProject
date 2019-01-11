//
//  TableView.m
//  APP
//
//  Created by BinGe on 2018/12/19.
//

#import "TableView.h"

@implementation TableView

- (instancetype)init
{
//    self = [super init];
    self = [super initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    if (self) {
        self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        self.tableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 1, 0.001)];
        self.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 1, 0.001)];
    }
    return self;
}

@end
