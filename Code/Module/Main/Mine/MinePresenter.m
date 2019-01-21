//
//  MinePresenter.m
//  APP
//
//  Created by BinGe on 2019/1/3.
//

#import "MinePresenter.h"
#import "MineViewHandler.h"

@implementation MinePresenter

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    self.handler = [[MineViewHandler alloc] initWithView:view];
    [self.handler setData:[[DataCenter get] userData]];
    WeakSelf(self)
    [DataCenter perform:OperationGetMineData params:nil callback:^(id  _Nonnull operation, Data * _Nullable data) {
        if (data.isSuccess) {
            [weakself.handler setData:[[DataCenter get] userData]];
        }
    }];
    
    return self;
}

- (void)willAppear {
    [self.handler setData:[[DataCenter get] userData]];
}

@end
