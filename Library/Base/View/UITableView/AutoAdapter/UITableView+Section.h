//
//  UITableView+AutoAdapter.h
//  APP
//
//  Created by BinGe on 2019/1/15.
//

#import <UIKit/UIKit.h>
#import "AutoTableViewSection.h"
#import "AutoTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (Section)

- (void)addSection:(AutoTableViewSection *)sction;

@end

NS_ASSUME_NONNULL_END
