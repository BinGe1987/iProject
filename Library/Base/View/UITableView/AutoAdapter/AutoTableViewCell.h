//
//  AutoTableViewCell.h
//  APP
//
//  Created by BinGe on 2019/1/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AutoTableViewCell : UITableViewCell

@property (nonatomic, assign) CGFloat cellHeight;

- (UITableView *)myTableView;

- (void)setCellData:(id)data;

- (void)tableViewCellDidSelect:(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END
