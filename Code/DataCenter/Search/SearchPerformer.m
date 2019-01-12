//
//  SearchPerformer.m
//  APP
//
//  Created by BinGe on 2019/1/12.
//

#import "SearchPerformer.h"

@implementation SearchPerformer

static int currentPage = 0;
- (id)perform:(id)operation params:(id)params callback:(ICallback)callback {
    Data *searchData = [Data withDictionary:params];
    HttpRequest *request = [HttpRequest withHost:[URLConstant host] api:API_HomeClub];
    request.data = @{
                     @"token"       :DataCenter.token,
                     @"laty"        :[NSNumber numberWithInt:0],
                     @"lngx"        :[NSNumber numberWithInt:0],
                     @"areaId"      :[searchData stringWithKey:@"areaId" defaultValue:@"0"],
                     @"page"        :[NSNumber numberWithInt:currentPage],
                     @"pageSize"    :@"10",
                     @"category"    :[searchData stringWithKey:@"category" defaultValue:@"0"],
                     @"sort"        :[searchData stringWithKey:@"sort" defaultValue:@"default"],
                     @"type"        :@"all",
                     @"search"      :[searchData stringWithKey:@"search" defaultValue:@""]
                     };
    HttpResponse *response = [Http post:request];
    Data *data = [Data new];
    data.source = [response.data mutableCopy];
    data.error = response.error;
    return data;
}



- (id)parse:(_Nonnull id)operation withSource:(id)source {
    if ([source isSuccess]) {
        ListData *listData = [ListData withData:source];
        Data *respData = [listData dataWithKey:@"respData"];
        NSArray *clubList = [respData arrayWithKey:@"clubList"];
        for (Data *club in clubList) {
            [listData addData:[ClubData withData:club]];
        }
        return listData;
    }
    return source;
}

@end
