//
//  CommentListPerformer.m
//  APP
//
//  Created by BinGe on 2019/1/3.
//

#import "CommentListPerformer.h"

@implementation CommentListPerformer

- (id)perform:(id)operation params:(id)params callback:(ICallback)callback {
    
    
    
    TechData *tech = params;
    HttpRequest *request = [HttpRequest withHost:[URLConstant host] api:API_TechGetComment];
    request.data = @{
                     @"token":DataCenter.token,
                     @"techId":tech.techID,
                     @"page":@"1",
                     @"pageSize":@"2",
                     @"type":@"selected",
                     };
    HttpResponse *response = [Http post:request];
    Data *data = [Data new];
    data.source = [response.data mutableCopy];
    data.error = response.error;
    return data;
}

- (id)parse:(_Nonnull id)operation withSource:(id)source {
    CommentListData *list = [CommentListData new];
//    
//    list.filters = [ListData new];
//    CommentFilterData *filter1 = [CommentFilterData new];
//    filter1.name = @"全部";
//    [list.filters addData:filter1];
//    CommentFilterData *filter2 = [CommentFilterData new];
//    filter2.name = @"全部";
//    [list.filters addData:filter2];
//    CommentFilterData *filter3 = [CommentFilterData new];
//    filter3.name = @"全部";
//    [list.filters addData:filter3];
//    
//    for (int i=0;i<20;i++) {
//        CommentData *comment = [CommentData new];
//        [list addData:comment];
//    }
//    
    return list;
}


@end
