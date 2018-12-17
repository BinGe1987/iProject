//
//  Presenter.m
//  YDD
//
//  Created by BinGe on 2018/12/5.
//

#import "Presenter.h"

@implementation Presenter

- (instancetype)initWithView:(UIView *)view {
    self = [super init];
    if (self) {
        self.view = view;
    }
    return self;
}

- (void)dealloc
{
    Log(@"Presenter dealloc");
}

@end
