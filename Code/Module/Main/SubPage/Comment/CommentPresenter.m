//
//  CommentPresenter.m
//  APP
//
//  Created by BinGe on 2019/1/3.
//

#import "CommentPresenter.h"
#import "CommentViewHandler.h"

@interface CommentPresenter()<ViewHandlerDelegate>

@property (nonatomic, strong) CommentViewHandler *viewHandler;
@property (nonatomic, strong) NSMutableDictionary *params;

@end

@implementation CommentPresenter

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    self.viewHandler = [[CommentViewHandler alloc] initWithView:view];
    self.viewHandler.delegate = self;
    
    UIViewController *vc = [view currentViewController];
    id data = vc.intentData;
    NSDictionary *params;
    if (data && [data isKindOfClass:[TechData class]]) {
        TechData *tech = data;
        params = @{@"relationId":tech.techID,
                   @"category":@"tech"};
        self.params = [@{@"techId":tech.techID} mutableCopy];
    } else {
        ClubData *club = data;
        params = @{@"relationId":club.clubID,
                   @"category":@"club"};
        self.params = [@{@"clubId":club.clubID} mutableCopy];
    }
    if (params) {
        WeakSelf(self)
        [[DataCenter get] perform:OperationGetCommentCategoryData params:params callback:^(id  _Nonnull operation, id  _Nullable data) {
            if ([data isSuccess]) {
                [weakself.viewHandler setCagetoryData:data];
            } 
        }];
    }
    return self;
}

- (void)onViewAction:(id)action data:(id)data {
    WeakSelf(self)
    if ([action isEqualToString:@"cagetory"]) {
        CommentCagetoryData *cagetoryData = data;
        [self.params setObject:cagetoryData.type forKey:@"type"];
        [[DataCenter get] perform:OperationGetCommentListData params:self.params callback:^(id  _Nonnull operation, id  _Nullable data) {
            [weakself.viewHandler setData:data];
        }];
    }
}

@end
