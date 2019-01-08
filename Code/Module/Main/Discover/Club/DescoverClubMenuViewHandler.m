//
//  DescoverClubMenuViewHandler.m
//  APP
//
//  Created by BinGe on 2019/1/2.
//

#import "DescoverClubMenuViewHandler.h"
#import "ClubMenu.h"

@implementation DescoverClubMenuViewHandler

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    return self;
}

- (void)setData:(id)data {

    ClubMenu *clubMenu = (ClubMenu *)self.view;
    [clubMenu setMenuData:data];
}

@end
