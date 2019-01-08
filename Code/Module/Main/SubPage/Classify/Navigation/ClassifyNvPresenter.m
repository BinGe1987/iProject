//
//  ClassifyNvPresenter.m
//  APP
//
//  Created by BinGe on 2019/1/8.
//

#import "ClassifyNvPresenter.h"
#import "ClassifyNvViewHandler.h"

@interface ClassifyNvPresenter()<ViewHandlerDelegate>

@end

@implementation ClassifyNvPresenter


- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    self.handler = [[ClassifyNvViewHandler alloc] initWithView:view];
    self.handler.delegate = self;
    return self;
}

- (void)onViewAction:(id)action data:(id)data {
    
}

@end
