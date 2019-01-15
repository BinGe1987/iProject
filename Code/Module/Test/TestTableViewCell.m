//
//  TestTableViewCell.m
//  APP
//
//  Created by BinGe on 2019/1/15.
//

#import "TestTableViewCell.h"


@implementation TestTableViewCell

- (void)setCellData:(id)data {
    self.cellHeight = [data floatValue];
}

- (void)tableViewCellDidSelect:(UITableView *)tableView {
    
}

@end
