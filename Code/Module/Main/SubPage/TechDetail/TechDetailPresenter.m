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
    
    TechData *tech = [view currentViewController].intentData;
    [Store setValue:tech.source forKey:@"test_data"];
    
    WeakSelf(self)
    [[DataCenter get] perform:OperationGetTechDetailData params:tech callback:^(id  _Nonnull operation, id  _Nullable data) {
        TechDetailData *detail = (TechDetailData *)data;
        [view currentViewController].title = detail.clubData.name;
        [weakself.handler setData:detail];
    }];
    
    return self;
}

- (void)onViewAction:(id)action data:(id)data {
    WeakSelf(self)
    [[DataCenter get] perform:OperationGetClubDetailData params:nil callback:^(id  _Nonnull operation, id  _Nullable data) {
        [weakself.handler setData:data];
    }];
}

@end

