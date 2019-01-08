//
//  DropdownMenu.h
//  APP
//
//  Created by BinGe on 2018/12/30.
//

#import <UIKit/UIKit.h>
#import "DropdownMenuItem.h"


#pragma mark - delegate
@protocol DropDownMenuDelegate <NSObject>
- (void)didMenuItemSelectSelete:(DropdownMenuItem *_Nonnull)item;
@end

NS_ASSUME_NONNULL_BEGIN

@interface DropdownMenu : UIView

@property (nonatomic, strong) NSArray *menuItems;

@property (nonatomic, assign) id<DropDownMenuDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame andMenuHeight:(NSInteger)height;

- (instancetype)initWithFrame:(CGRect)frame andDropdownViewHeight:(NSInteger)height;

@end

NS_ASSUME_NONNULL_END
