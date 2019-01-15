//
//  AutoTableViewCell.m
//  APP
//
//  Created by BinGe on 2019/1/15.
//

#import "AutoTableViewCell.h"

@implementation AutoTableViewCell

- (UITableView *)myTableView {
    UIView *tableView = self.superview;
    while (![tableView isKindOfClass:[UITableView class]] && tableView) {
        tableView = tableView.superview;
    }
    return (UITableView *)tableView;
}

- (void)setCellData:(id)data {
    
}

- (void)tableViewCellDidSelect:(UITableView *)tableView {
    
}

- (CGFloat)cellHeight {
    return _cellHeight ? _cellHeight : 20;
}

@end
