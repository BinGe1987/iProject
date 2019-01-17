//
//  HomeNvPresenter.m
//  APP
//
//  Created by BinGe on 2018/12/25.
//

#import "HomeNvPresenter.h"
#import "HomeNvViewHandler.h"

@interface HomeNvPresenter()<ViewHandlerDelegate>

@end

@implementation HomeNvPresenter

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    self.handler = [[HomeNvViewHandler alloc] initWithView:view];
    [self.handler setDelegate:self];
    return self;
}

- (void)onViewAction:(id)action data:(id)data {
    
}

@end
