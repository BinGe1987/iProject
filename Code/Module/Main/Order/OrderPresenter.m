//
//  OrderPresenter.m
//  APP
//
//  Created by BinGe on 2018/12/28.
//

#import "OrderPresenter.h"
#import "OrderViewHandler.h"

@interface OrderPresenter()<ViewHandlerDelegate>

@end

@implementation OrderPresenter

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    self.handler = [[OrderViewHandler alloc] initWithView:view];
    self.handler.delegate = self;
    
    WeakSelf(self)
    [[DataCenter get] perform:OperationGetOrderData params:nil callback:^(id  _Nonnull operation, id  _Nullable data) {
        [weakself.handler setData:data];
    }];
    
    return self;
}

- (void)onViewAction:(id)action {
//    WeakSelf(self)
//    [[DataCenter get] perform:OperationGetOrderData params:nil callback:^(id  _Nonnull operation, id  _Nullable data) {
//        [weakself.handler setData:data];
//    }];
}

@end
