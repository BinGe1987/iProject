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
    self.handler.delegate = self;
    
    WeakSelf(self)
    [[DataCenter get] perform:OperationGetClubDetailData params:nil callback:^(id  _Nonnull operation, id  _Nullable data) {
        [weakself.handler setData:data];
    }];
    
    return self;
}

- (void)onViewAction:(id)action {
    WeakSelf(self)
    [[DataCenter get] perform:OperationGetClubDetailData params:nil callback:^(id  _Nonnull operation, id  _Nullable data) {
        [weakself.handler setData:data];
    }];
}

@end
