//
//  Presenter.m
//  YDD
//
//  Created by BinGe on 2018/12/5.
//

#import "Presenter.h"

@implementation Presenter

+ (instancetype)presenterWithView:(UIView *)view {
    return [[[self class] alloc] initWithView:view];
}

- (instancetype)initWithView:(UIView *)view {
    return [super init];
}

- (void)willAppear {}

- (void)didAppear {}

- (void)willDisappear {}

- (void)didDisappear {}

- (void)dealloc {}

@end
