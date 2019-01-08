//
//  ClassifyPresenter.m
//  APP
//
//  Created by BinGe on 2019/1/8.
//

#import "ClassifyPresenter.h"
#import "ClassifyViewHandler.h"
#import "ClassifyMenuViewHandler.h"

@interface ClassifyPresenter()<ViewHandlerDelegate>

@property (nonatomic, strong) ClassifyMenuViewHandler *menuViewHandler;
@property (nonatomic, strong) ClassifyViewHandler *clubViewHandler;

@property (nonatomic, strong) NSDictionary *menuDict;

@end

@implementation ClassifyPresenter

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    
    self.menuDict = [NSMutableDictionary new];
    
    self.clubViewHandler = [[ClassifyViewHandler alloc] initWithView:[view findViewByName:@"table"]];
    self.clubViewHandler.delegate = self;
    
    self.menuViewHandler = [[ClassifyMenuViewHandler alloc] initWithView:[view findViewByName:@"menu"]];
    self.menuViewHandler.delegate = self;
    
    WeakSelf(self)
    [[DataCenter get] perform:OperationGetClubFilterData params:nil callback:^(id  _Nonnull operation, id  _Nullable data) {
        [weakself.menuViewHandler setData:data];
        [[DataCenter get] perform:OperationGetDiscoverClubData params:nil callback:^(id  _Nonnull operation, id  _Nullable data) {
            [weakself.clubViewHandler setData:data];
            [weakself.clubViewHandler setRefreshHandler];
        }];
    }];
    
    return self;
}

- (void)onViewAction:(id)action data:(id)data {
    if ([action isEqualToString:@"action_filter"]) {
        [self refreshClubData:data];
    }
    
    if ([action isEqualToString:@"action_refresh_head"]) {
        [self refreshClubData:data];
    }
    else if ([action isEqualToString:@"action_refresh_foot"]) {
        WeakSelf(self)
        [[DataCenter get] perform:OperationGetDiscoverClubDataDropUp params:[Data withDictionary:self.menuDict] callback:^(id  _Nonnull operation, id  _Nullable data) {
            [weakself.clubViewHandler updateData:data];
        }];
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
        [self.menuDict setValue:[params stringWithKey:@"value"] forKey:@"category"];
    }
    else if ([type isEqualToString:@"club_sort"]) {
        [self.menuDict setValue:[params stringWithKey:@"value"] forKey:@"sort"];
    }
    
    [[DataCenter get] perform:OperationGetDiscoverClubData params:[Data withDictionary:self.menuDict] callback:^(id  _Nonnull operation, id  _Nullable data) {
        [weakself.clubViewHandler setData:data];
    }];
}

@end
