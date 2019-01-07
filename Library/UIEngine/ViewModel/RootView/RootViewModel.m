//
//  RootViewModel.m
//  APP
//
//  Created by BinGe on 2019/1/7.
//

#import "RootViewModel.h"

@implementation RootViewModel

- (Class)ViewClass {
    return [RootView class];
}
- (Class)ViewParamsClass {
    return [RootViewParams class];
}

- (Class)LayoutParamsClass {
    return [RootViewLayoutParams class];
}

@end
