//
//  HomePresenter.m
//  APP
//
//  Created by BinGe on 2018/12/25.
//

#import "HomePresenter.h"
#import "HomeViewHandler.h"

@interface HomePresenter()<ViewHandlerDelegate>

@end

@implementation HomePresenter

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    self.handler = [[HomeViewHandler alloc] initWithView:view];
    self.handler.delegate = self;
    return self;
}

- (void)onViewAction:(id)action withTarget:(id)target {
    
}

- (void)willAppear:(BOOL)animated {
    
}

@end
