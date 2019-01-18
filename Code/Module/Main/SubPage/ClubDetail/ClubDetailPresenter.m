//
//  ClubDetailPresenter.m
//  APP
//
//  Created by BinGe on 2019/1/2.
//

#import "ClubDetailPresenter.h"
#import "ClubDetailViewHandler.h"

@interface ClubDetailPresenter()<ViewHandlerDelegate>

@end

@implementation ClubDetailPresenter

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    self.handler = [[ClubDetailViewHandler alloc] initWithView:view];
    [self.handler setDelegate:self];
    
    ClubData *club = [view currentViewController].intentData;
    WeakSelf(self)
    [[DataCenter get] perform:OperationGetClubDetailData params:club callback:^(id  _Nonnull operation, id  _Nullable data) {
        ClubDetailData *detail = (ClubDetailData *)data;
        [weakself.handler setData:detail];
    }];
    
    return self;
}

- (void)onViewAction:(id)action data:(id)data {
    WeakSelf(self)
    if ([action isEqualToString:@"action_follow"]) {
        [[DataCenter get] perform:OperationFollowClub params:data callback:^(id  _Nonnull operation, id  _Nullable data) {
            if ([data isKindOfClass:[ClubData class]]) {
                [weakself.handler followStatus:(ClubData *)data];
            } else {
                
            }
        }];
    } else {
        [[DataCenter get] perform:OperationGetClubDetailData params:nil callback:^(id  _Nonnull operation, id  _Nullable data) {
            [weakself.handler setData:data];
        }];
    }
}

@end
