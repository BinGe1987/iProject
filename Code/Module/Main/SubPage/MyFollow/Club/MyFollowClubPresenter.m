//
//  MyFollowClubPresenter.m
//  APP
//
//  Created by BinGe on 2019/1/17.
//

#import "MyFollowClubPresenter.h"
#import "MyFollowClubViewHandler.h"

@interface MyFollowClubPresenter()<ViewHandlerDelegate>

@property (nonatomic, strong) ListData *listData;

@end

@implementation MyFollowClubPresenter

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    
    self.handler = [MyFollowClubViewHandler handlerWithView:view delgate:self];
    return self;
}

- (void)onFocus {
    NSLog(@"on focus : %@",self);
    if (!self.listData) {
        [DataCenter perform:OperationGetMineFollowClubData params:nil callback:^(id  _Nonnull operation, Data * _Nullable data) {
            
        }];
    }
}

- (void)onViewAction:(id)action data:(id)data {
    
}

@end
