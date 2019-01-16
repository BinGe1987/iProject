//
//  ViewModel.m
//  UIEngine
//
//  Created by BinGe on 2018/11/27.
//  Copyright © 2018 Bin. All rights reserved.
//

#import "ViewModel.h"

@interface ViewModel()

@end

@implementation ViewModel

- (instancetype)initWithUIModel:(id<UIModel>)model {
    self = [super init];
    if (self) {
        self.model = model;
        self.view = [[[self ViewClass] alloc] initWithViewParams:[[[self ViewParamsClass] alloc] initWithModel:model]];
        [self initialize];
    }
    return self;
}

- (void)initialize {
//    NSLog(@"ViewModel 初始化！");
}

- (Class)ViewClass {
    return [UIView class];
}

- (Class)ViewParamsClass {
    return [ViewParams class];
}

@end
