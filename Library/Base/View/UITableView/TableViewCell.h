//
//  TableViewCell.h
//  APP
//
//  Created by BinGe on 2019/1/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TableViewCell : UITableViewCell

+ (instancetype)tableView:(UITableView *)tableView cellWithSize:(CGSize)size;

- (UITableView *)myTableView;

- (void)setData:(id)data;

@end

NS_ASSUME_NONNULL_END
