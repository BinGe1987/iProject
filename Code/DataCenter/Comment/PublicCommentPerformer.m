//
//  PublicCommentPerformer.m
//  APP
//
//  Created by BinGe on 2019/1/15.
//

#import "PublicCommentPerformer.h"

@implementation PublicCommentPerformer

- (id)perform:(id)operation params:(id)params callback:(ICallback)callback {
    NSMutableDictionary *publicData = [params mutableCopy];
    [publicData setObject:DataCenter.token forKey:@"token"];
    HttpRequest *request = [HttpRequest withHost:[URLConstant host] api:API_CommentPublic];
    request.data = publicData;
    HttpResponse *response = [Http post:request];
    Data *data = [Data new];
    data.source = [response.data mutableCopy];
    data.error = response.error;
    return data;
}

- (id)parse:(_Nonnull id)operation withSource:(id)source {
    return source;
}

@end
