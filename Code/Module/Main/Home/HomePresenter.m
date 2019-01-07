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
    
    WeakSelf(self)
    Log(@"HomePresenter new...");
    [[DataCenter get] perform:OperationGetHomeData params:nil callback:^(id  _Nonnull operation, id  _Nullable data) {
        [weakself.handler setData:data];
    }];
    
    [[DataCenter get] perform:OperationGetHomeDataClubDropdown params:nil callback:^(id  _Nonnull operation, id  _Nullable data) {
        [((HomeViewHandler *)weakself.handler) setClubData:data];
    }];
    
    return self;
}

- (void)onViewAction:(id)action data:(id)data {
    WeakSelf(self)
    if ([action isEqualToString:@"action_refresh_foot"]) {
        [[DataCenter get] perform:OperationGetHomeDataClubDropup params:nil callback:^(id  _Nonnull operation, id  _Nullable data) {
            [((HomeViewHandler *)weakself.handler) insertClubData:data];
        }];
    }
}

@end
