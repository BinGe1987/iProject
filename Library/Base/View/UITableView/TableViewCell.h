//
//  TableViewCell.h
//  APP
//
//  Created by BinGe on 2019/1/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TableViewCell : UITableViewCell

@property (nonatomic, assign) id data;

+ (instancetype)tableView:(UITableView *)tableView cellWithSize:(CGSize)size;

+ (instancetype)tableView:(UITableView *)tableView cellSizeValue:(NSValue *)size;

- (UITableView *)myTableView;

- (void)setCellData:(id)data;

- (void)tableViewCellDidSelect:(UITableView *)tableView;

- (CGFloat)heightForCell;

@end

NS_ASSUME_NONNULL_END
