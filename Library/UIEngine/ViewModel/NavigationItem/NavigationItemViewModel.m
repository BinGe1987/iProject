//
//  NavigationItemViewModel.m
//  APP
//
//  Created by BinGe on 2019/1/14.
//

#import "NavigationItemViewModel.h"

@implementation NavigationItemViewModel

- (Class)ViewClass {
    return [NavigationItemView class];
}
- (Class)ViewParamsClass {
    return [FrameLayoutViewParams class];
}

- (Class)LayoutParamsClass {
    return [FrameLayoutParams class];
}

@end
