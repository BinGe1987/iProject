//
//  TechDetailPresenter.m
//  APP
//
//  Created by BinGe on 2019/1/2.
//

#import "TechDetailPresenter.h"
#import "TechDetailViewHandler.h"

@interface TechDetailPresenter()<ViewHandlerDelegate>

@end

@implementation TechDetailPresenter

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    self.handler = [[TechDetailViewHandler alloc] initWithView:view];
    self.handler.delegate = self;
    
    WeakSelf(self)
    [[DataCenter get] perform:OperationGetTechDetailData params:nil callback:^(id  _Nonnull operation, Data *  _Nullable data) {
        TechDetailData *detail = (TechDetailData *)data;
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

