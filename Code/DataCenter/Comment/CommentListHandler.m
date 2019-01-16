//
//  CommentListHandler.m
//  APP
//
//  Created by BinGe on 2019/1/3.
//

#import "CommentListHandler.h"
#import "CommentListPerformer.h"
#import "CommentCategoryPerformer.h"
#import "PublicCommentPerformer.h"

@implementation CommentListHandler

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self bind:OperationGetCommentCategoryData  performerPlus:[CommentCategoryPerformer class]];
        [self bind:OperationGetCommentListData      performerPlus:[CommentListPerformer class]];
        [self bind:OperationPublicCommentData       performerPlus:[PublicCommentPerformer class]];
    }
    return self;
}


@end
