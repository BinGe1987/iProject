//
//  DiscoverClubPresenter.m
//  APP
//
//  Created by BinGe on 2018/12/27.
//

#import "DiscoverClubPresenter.h"
#import "DiscoverClubViewHandler.h"
#import "DescoverClubMenuViewHandler.h"

@interface DiscoverClubPresenter()<ViewHandlerDelegate>

@property (nonatomic, strong) ViewHandler *menuViewHandler;

@property (nonatomic, strong) NSDictionary *menuDict;

@end


@implementation DiscoverClubPresenter

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    
    self.menuDict = [NSMutableDictionary new];
    
    self.handler = [[DiscoverClubViewHandler alloc] initWithView:[view findViewByName:@"table"]];
    self.handler.delegate = self;
    
    self.menuViewHandler = [[DescoverClubMenuViewHandler alloc] initWithView:[view findViewByName:@"menu"]];
    self.menuViewHandler.delegate = self;
    
    WeakSelf(self)
    [[DataCenter get] perform:OperationGetClubFilterData params:nil callback:^(id  _Nonnull operation, id  _Nullable data) {
        [weakself.menuViewHandler setData:data];
        [weakself refreshClubData:nil];
    }];

    return self;
}

- (void)onViewAction:(id)action data:(id)data {
    if ([action isEqualToString:@"action_filter"]) {
        [self refreshClubData:data];
    }
}

- (void)refreshClubData:(Data *)data {
    WeakSelf(self)
    Data *params = [Data withData:data];
    NSString *type = [params stringWithKey:@"type"];
    if (!type) {
        NSString *areaId = [params stringWithKey:@"id"];
        if (areaId) {
            [self.menuDict setValue:areaId forKey:@"areaId"];
        }
    }
    else if ([type isEqualToString:@"club_category"]) {
        [self.menuDict setValue:[params stringWithKey:@"id"] forKey:@"category"];
    }
    else if ([type isEqualToString:@"club_sort"]) {
        [self.menuDict setValue:[params stringWithKey:@"value"] forKey:@"sort"];
    }
    
    [[DataCenter get] perform:OperationGetDiscoverClubData params:[Data withDictionary:self.menuDict] callback:^(id  _Nonnull operation, id  _Nullable data) {
        [weakself.handler setData:data];
    }];
}

@end
