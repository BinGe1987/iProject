//
//  DiscoverTechPresenter.m
//  APP
//
//  Created by BinGe on 2018/12/27.
//

#import "DiscoverTechPresenter.h"
#import "DiscoverTechViewHandler.h"

@interface DiscoverTechPresenter()<ViewHandlerDelegate>

@property (nonatomic, assign) NSInteger current;
@property (nonatomic, strong) DiscoverTechViewHandler *techHandler;

@end

@implementation DiscoverTechPresenter

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    self.techHandler = [[DiscoverTechViewHandler alloc] initWithView:view];
    self.techHandler.delegate = self;

    [self refreshData];
    
    [self.techHandler performSelector:@selector(setRefreshHandler) withObject:nil afterDelay:1];
    
    return self;
}

- (void)onViewAction:(id)action data:(id)data {
    if ([action isEqualToString:@"list_changed"]) {
        self.current = [data integerValue];
        [self refreshData];
    }
    if ([action isEqualToString:@"action_refresh_head"]) {
        [self refreshData];
    }
    else if ([action isEqualToString:@"action_refresh_foot"]) {
        WeakSelf(self)
        [[DataCenter get] perform:OperationGetDiscoverTechDataDropUp params:@(self.current) callback:^(id  _Nonnull operation, id  _Nullable data) {
            [weakself.techHandler updateData:data];
        }];
    }
}

- (void)refreshData {
    WeakSelf(self)
    [[DataCenter get] perform:OperationGetDiscoverTechData params:@(self.current) callback:^(id  _Nonnull operation, id  _Nullable data) {
        [weakself.techHandler setData:data];
    }];
}

@end
