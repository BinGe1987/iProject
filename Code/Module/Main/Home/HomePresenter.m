//
//  HomePresenter.m
//  APP
//
//  Created by BinGe on 2018/12/25.
//

#import "HomePresenter.h"
#import "HomeViewHandler.h"

@interface HomePresenter()<ViewHandlerDelegate>

@property (nonatomic, strong) HomeViewHandler *homeHandler;

@end

@implementation HomePresenter

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    self.homeHandler = [[HomeViewHandler alloc] initWithView:view];
    self.homeHandler.delegate = self;
    
    [self onLogin:[DataCenter get].userData];
    [EventBus addObserver:self selector:@selector(onLogin:) event:EventLoginStatusChanged];
    
    return self;
}

- (void)onLogin:(UserData *)user {
    if (user.isLogin) {
        WeakSelf(self)
        [self.homeHandler startLoading];
        [[DataCenter get] perform:OperationGetHomeData params:nil callback:^(id  _Nonnull operation, id  _Nullable data) {
            [weakself.homeHandler setData:data];
        }];
        [[DataCenter get] perform:OperationGetHomeDataTech params:nil callback:^(id  _Nonnull operation, id  _Nullable data) {
            [weakself.homeHandler setTechData:data];
        }];
        [[DataCenter get] perform:OperationGetHomeDataClubDropdown params:nil callback:^(id  _Nonnull operation, id  _Nullable data) {
            [weakself.homeHandler setClubData:data];
        }];
    }
}

- (void)onViewAction:(id)action data:(id)data {
    WeakSelf(self)
    if ([action isEqualToString:@"action_refresh_foot"]) {
        [[DataCenter get] perform:OperationGetHomeDataClubDropup params:nil callback:^(id  _Nonnull operation, id  _Nullable data) {
             [weakself.homeHandler insertClubData:data];
        }];
    }
    else if ([action isEqualToString:@"action_refresh_head"]) {
        [[DataCenter get] perform:OperationGetHomeDataClubDropdown params:nil callback:^(id  _Nonnull operation, id  _Nullable data) {
             [weakself.homeHandler setClubData:data];
        }];
    }
}

@end
