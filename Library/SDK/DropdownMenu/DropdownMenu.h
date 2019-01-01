//
//  DropdownMenu.h
//  APP
//
//  Created by BinGe on 2018/12/30.
//

#import <UIKit/UIKit.h>
#import "DropdownMenuItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface DropdownMenu : UIView

@property (nonatomic, strong) NSArray *menuItems;

- (instancetype)initWithFrame:(CGRect)frame andMenuHeight:(NSInteger)height;

@end

NS_ASSUME_NONNULL_END
