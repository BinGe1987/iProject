//
//  DiscoverTechPresenter.m
//  APP
//
//  Created by BinGe on 2018/12/27.
//

#import "DiscoverTechPresenter.h"
#import "DiscoverTechViewHandler.h"

@interface DiscoverTechPresenter()<ViewHandlerDelegate>

@end

@implementation DiscoverTechPresenter

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    self.handler = [[DiscoverTechViewHandler alloc] initWithView:[view findViewByName:@"collection"]];
    self.handler.delegate = self;

    WeakSelf(self)
    [[DataCenter get] perform:OperationGetDiscoverTechData params:nil callback:^(id  _Nonnull operation, id  _Nullable data) {
        [weakself.handler setData:data];
    }];
    
    return self;
}

- (void)onViewAction:(id)action data:(id)data {
    
}

@end
