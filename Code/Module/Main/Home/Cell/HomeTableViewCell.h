//
//  HomeTableViewCell.h
//  APP
//
//  Created by BinGe on 2018/12/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeTableViewCell : UITableViewCell

@property (nonatomic, assign) id cellData;

+ (instancetype)tableView:(UITableView *)tableView cellWithSize:(CGSize)size;

- (void)setData:(id)data;

@end

NS_ASSUME_NONNULL_END
