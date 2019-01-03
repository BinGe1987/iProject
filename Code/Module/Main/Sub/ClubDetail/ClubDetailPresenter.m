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
    [[DataCenter get] perform:OperationGetClubDetailData params:nil callback:^(id  _Nonnull operation, Data *  _Nullable data) {
        ClubDetailData *detail = (ClubDetailData *)data;
//        [view currentViewController].navigationController.navigationBar.topItem.title = detail.clubData.name;
        [view currentViewController].title = detail.clubData.name;
        [weakself.handler setData:data];
    }];
    
    return self;
}

- (void)onViewAction:(id)action data:(id)data {
    WeakSelf(self)
    [[DataCenter get] perform:OperationGetClubDetailData params:nil callback:^(id  _Nonnull operation, Data *  _Nullable data) {
        [weakself.handler setData:data];
    }];
}

@end
