//
//  CommentListData.m
//  APP
//
//  Created by BinGe on 2019/1/3.
//

#import "CommentListData.h"

@implementation CommentListData

- (void)setData:(Data *)data {
    [super setData:data];
    
    Data *resp = [data dataWithKey:@"respData"];
    NSArray *commentList = [resp arrayWithKey:@"list"];
    for (Data *comment in commentList) {
        [self addData:[CommentData withData:comment]];
    }
}

@end
