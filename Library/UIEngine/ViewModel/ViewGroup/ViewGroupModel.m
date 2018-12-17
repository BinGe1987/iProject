//
//  ViewGroupModel.m
//  UIEngine
//
//  Created by BinGe on 2018/11/27.
//  Copyright © 2018 Bin. All rights reserved.
//

#import "ViewGroupModel.h"


@interface ViewGroupModel()

@property (nonatomic, strong) NSMutableArray *chidViewModel;

@end

@implementation ViewGroupModel

- (void)addChildViewModel:(ViewModel *)child {
    if (!self.chidViewModel) {
        self.chidViewModel = [[NSMutableArray alloc] init];
    }
    [self.chidViewModel addObject:child];
    [self onChildViewModelAdded:child];
}

- (void)onChildViewModelAdded:(ViewModel *)child {
    LayoutParams *layoutParams = [[[self LayoutParamsClass] alloc] initWithModel:child.model];
    [child.view setLayoutParams:layoutParams];
    if ([self.view conformsToProtocol:@protocol(ViewGroupDelegate)]) {
        id<ViewGroupDelegate> vg = (id<ViewGroupDelegate>)self.view;
        [vg addView:child.view];
    }
}

- (Class)ViewClass {
    return [ViewGroup class];
}
- (Class)ViewParamsClass {
    return [GroupViewParams class];
}
- (Class)LayoutParamsClass {
    return [LayoutParams class];
}

@end
