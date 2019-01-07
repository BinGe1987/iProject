//
//  CommentPresenter.m
//  APP
//
//  Created by BinGe on 2019/1/3.
//

#import "CommentPresenter.h"
#import "CommentViewHandler.h"

@interface CommentPresenter()<ViewHandlerDelegate>

@end

@implementation CommentPresenter

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    self.handler = [[CommentViewHandler alloc] initWithView:view];
    self.handler.delegate = self;
    
    WeakSelf(self)
    [[DataCenter get] perform:OperationGetCommentListData params:nil callback:^(id  _Nonnull operation, id  _Nullable data) {
        CommentListData *list = (CommentListData *)data;
        [weakself.handler setData:list];
    }];
    
    return self;
}

- (void)onViewAction:(id)action data:(id)data {
    WeakSelf(self)
    [[DataCenter get] perform:OperationGetCommentListData params:nil callback:^(id  _Nonnull operation, id  _Nullable data) {
        [weakself.handler setData:data];
    }];
}

@end
