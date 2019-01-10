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
    }
    if (params) {
        WeakSelf(self)
        [[DataCenter get] perform:OperationGetCommentCategoryData params:params callback:^(id  _Nonnull operation, id  _Nullable data) {
            if ([data isSuccess]) {
                [weakself.viewHandler setCagetoryData:data];
            } 
        }];
    }
//    [[DataCenter get] perform:OperationGetCommentListData params:nil callback:^(id  _Nonnull operation, id  _Nullable data) {
//        CommentListData *list = (CommentListData *)data;
//        [weakself.handler setData:list];
//    }];
    
    return self;
}

- (void)onViewAction:(id)action data:(id)data {
    WeakSelf(self)
    [[DataCenter get] perform:OperationGetCommentListData params:nil callback:^(id  _Nonnull operation, id  _Nullable data) {
        [weakself.handler setData:data];
    }];
}

@end
