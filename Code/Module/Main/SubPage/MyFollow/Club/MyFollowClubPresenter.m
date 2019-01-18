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
        WeakSelf(self)
        [DataCenter perform:OperationGetMineFollowClubData params:nil callback:^(id  _Nonnull operation, Data * _Nullable data) {
            if ([data isSuccess]) {
                weakself.listData = (ListData *)data;
                [self.handler setClubList:weakself.listData];
            }
        }];
    }
}

- (void)onViewAction:(id)action data:(id)data {
    
}

@end
