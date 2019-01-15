//
//  AutoTableViewCell.h
//  APP
//
//  Created by BinGe on 2019/1/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AutoTableViewCell : UITableViewCell

- (UITableView *)myTableView;

- (void)setCellData:(id)data;

- (void)tableViewCellDidSelect:(UITableView *)tableView;

- (CGFloat)heightForCell;

@end

NS_ASSUME_NONNULL_END
