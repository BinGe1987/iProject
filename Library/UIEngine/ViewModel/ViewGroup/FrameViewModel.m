//
//  FrameViewModel.m
//  UIEngine
//
//  Created by BinGe on 2018/11/28.
//  Copyright © 2018 Bin. All rights reserved.
//

#import "FrameViewModel.h"

@interface FrameViewModel()

@property (nonatomic, strong) FrameLayout *frameLayout;

@end

@implementation FrameViewModel

- (void)initialize {
    self.frameLayout = (FrameLayout *)self.view;
}

- (Class)ViewClass {
    return [FrameLayout class];
}
- (Class)ViewParamsClass {
    return [FrameLayoutViewParams class];
}

- (Class)LayoutParamsClass {
    return [FrameLayoutParams class];
}

@end
