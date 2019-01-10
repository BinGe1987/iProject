//
//  CommentCategoryPerformer.m
//  APP
//
//  Created by BinGe on 2019/1/10.
//

#import "CommentCategoryPerformer.h"

@implementation CommentCategoryPerformer

- (id)perform:(id)operation params:(id)params callback:(ICallback)callback {
    HttpRequest *request = [HttpRequest withHost:[URLConstant host] api:API_CommentGetCategory];
    request.data = @{
                     @"token":DataCenter.token,
                     @"page":@"1",
                     @"pageSize":@"10",
                     @"relationId":params[@"relationId"],
                     @"category":params[@"category"],
                     };
    HttpResponse *response = [Http post:request];
    Data *data = [Data new];
    data.source = [response.data mutableCopy];
    data.error = response.error;
    return data;
}

- (id)parse:(_Nonnull id)operation withSource:(id)source {
    if ([source isSuccess]) {
        Data *data = [source dataWithKey:@"respData"];
        NSArray *array = [data arrayWithKey:@"list"];
        ListData *list = [ListData withData:source];
        for (Data *cagetory in array) {
            [list addData:[CommentCagetoryData withData:cagetory]];
        }
        return list;
    }
    return source;
}

@end
