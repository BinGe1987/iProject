//
//  NavigationViewModel.m
//  APP
//
//  Created by BinGe on 2019/1/4.
//

#import "NavigationViewModel.h"

@implementation NavigationViewModel

- (void)initialize {
//    self.frameLayout = (FrameLayout *)self.view;
}

- (Class)ViewClass {
    return [NavigationView class];
}
- (Class)ViewParamsClass {
    return [NavigationViewParams class];
}

- (Class)LayoutParamsClass {
    return [NavigationLayoutParams class];
}

@end
