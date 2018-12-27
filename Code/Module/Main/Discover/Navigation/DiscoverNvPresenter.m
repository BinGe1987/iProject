//
//  DiscoverNvPresenter.m
//  APP
//
//  Created by BinGe on 2018/12/27.
//

#import "DiscoverNvPresenter.h"
#import "DiscoverNvViewHandler.h"

@interface DiscoverNvPresenter()<ViewHandlerDelegate>

@end

@implementation DiscoverNvPresenter

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    self.handler = [[DiscoverNvViewHandler alloc] initWithView:view];
    self.handler.delegate = self;
    return self;
}

- (void)onViewAction:(id)action {
    
}

- (void)viewPager:(id)viewPager pageIndexDidChanged:(NSInteger)index {

}

@end
