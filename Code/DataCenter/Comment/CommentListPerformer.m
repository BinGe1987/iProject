//
//  CommentListPerformer.m
//  APP
//
//  Created by BinGe on 2019/1/3.
//

#import "CommentListPerformer.h"

@implementation CommentListPerformer

- (id)perform:(id)operation params:(id)params callback:(ICallback)callback {
    
    if (params[@"techId"]) {
        HttpRequest *request = [HttpRequest withHost:[URLConstant host] api:API_TechGetComment];
        request.data = @{
                         @"token":DataCenter.token,
                         @"techId":params[@"techId"],
                         @"page":@"1",
                         @"pageSize":@"10",
                         @"type":params[@"type"],
                         };
        HttpResponse *response = [Http post:request];
        Data *data = [Data new];
        data.source = [response.data mutableCopy];
        data.error = response.error;
        return data;
    } else {
        HttpRequest *request = [HttpRequest withHost:[URLConstant host] api:API_ClubGetCommentList];
        request.data = @{
                         @"token":DataCenter.token,
                         @"clubId":params[@"clubId"],
                         @"page":@"1",
                         @"pageSize":@"10",
                         @"type":params[@"type"],
                         };
        HttpResponse *response = [Http post:request];
        Data *data = [Data new];
        data.source = [response.data mutableCopy];
        data.error = response.error;
        return data;
    }
    
    return [Data new];
}

- (id)parse:(_Nonnull id)operation withSource:(id)source {
    CommentListData *list = [CommentListData withData:source];
    return list;
}


@end
