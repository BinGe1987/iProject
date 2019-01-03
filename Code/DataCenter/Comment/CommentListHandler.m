//
//  CommentListHandler.m
//  APP
//
//  Created by BinGe on 2019/1/3.
//

#import "CommentListHandler.h"
#import "CommentListPerformer.h"

@implementation CommentListHandler

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self bind:OperationGetCommentListData performerPlus:[CommentListPerformer class]];
    }
    return self;
}


@end
