//
//  MyFollowTechPresenter.m
//  APP
//
//  Created by BinGe on 2019/1/17.
//

#import "MyFollowTechPresenter.h"
#import "MyFollowTechViewHandler.h"

@interface MyFollowTechPresenter()<ViewHandlerDelegate>

@property (nonatomic, strong) ListData *listData;

@end

@implementation MyFollowTechPresenter

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    
    self.handler = [MyFollowTechViewHandler handlerWithView:view delgate:self];
    return self;
}

- (void)onFocus {
    NSLog(@"on focus : %@",self);
    if (!self.listData) {
        [DataCenter perform:OperationGetMineFollowTechData params:nil callback:^(id  _Nonnull operation, Data * _Nullable data) {
            
        }];
    }
}

- (void)onViewAction:(id)action data:(id)data {
    
}

@end
