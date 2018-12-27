//
//  DiscoverClubPresenter.m
//  APP
//
//  Created by BinGe on 2018/12/27.
//

#import "DiscoverClubPresenter.h"
#import "DiscoverClubViewHandler.h"

@interface DiscoverClubPresenter()<ViewHandlerDelegate>

@end


@implementation DiscoverClubPresenter

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    self.handler = [[DiscoverClubViewHandler alloc] initWithView:[view findViewByName:@"table"]];
    self.handler.delegate = self;
    
    WeakSelf(self)
    [[DataCenter get] perform:OperationGetDiscoverClubData params:nil callback:^(id  _Nonnull operation, id  _Nullable data) {
        [weakself.handler setData:data];
    }];
    
    
    return self;
}

- (void)onViewAction:(id)action {
    WeakSelf(self)
    [[DataCenter get] perform:OperationGetHomeData params:nil callback:^(id  _Nonnull operation, id  _Nullable data) {
        [weakself.handler setData:data];
    }];
}

@end
