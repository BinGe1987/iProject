//
//  DescoverClubMenuViewHandler.m
//  APP
//
//  Created by BinGe on 2019/1/2.
//

#import "DescoverClubMenuViewHandler.h"
#import "ClubMenu.h"

@interface DescoverClubMenuViewHandler()<DropDownMenuDelegate>



@end

@implementation DescoverClubMenuViewHandler

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    
    
    ClubMenu *clubMenu = (ClubMenu *)self.view;
    clubMenu.delegate = self;
    
    return self;
}

- (void)didMenuItemSelectSelete:(DropdownMenuItem *)item {
    Data *itemData = item.data;
    if (itemData) {
        [self.delegate onViewAction:@"action_filter" data:itemData];
    }
}

- (void)setData:(id)data {

    ClubMenu *clubMenu = (ClubMenu *)self.view;
    
    [clubMenu setMenuData:data];
}

@end
