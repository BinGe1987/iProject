//
//  ClubTechListPresenter.m
//  APP
//
//  Created by BinGe on 2019/1/13.
//

#import "ClubTechListPresenter.h"
#import "ClubTechListViewHandler.h"

@implementation ClubTechListPresenter

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    
    self.handler = [[ClubTechListViewHandler alloc] initWithView:view];
    UIViewController *vc = [view currentViewController];
    WeakSelf(self)
    [DataCenter perform:OperationGetClubTechListData params:vc.intentData callback:^(id  _Nonnull operation, Data * _Nullable data) {
        if (data.isSuccess) {
            [weakself.handler setData:data];
        }
    }];
    
    return self;
}

@end
