//
//  DiscoverClubPerformer.m
//  APP
//
//  Created by BinGe on 2018/12/27.
//

#import "DiscoverClubPerformer.h"

static int currentPage = 0;
@implementation DiscoverClubPerformer
- (id)perform:(id)operation params:(id)params callback:(ICallback)callback {
    
    if ([operation isEqualToString:OperationGetDiscoverClubDataDropUp]) {
        currentPage += 1;
    } else {
        currentPage = 1;
    }
    
    Data *paramsData = [Data withData:params];
    
    HttpRequest *request = [HttpRequest withHost:[URLConstant host] api:API_HomeClub];
    request.data = @{
                     @"token"       :DataCenter.token,
                     @"laty"        :[NSNumber numberWithInt:0],
                     @"lngx"        :[NSNumber numberWithInt:0],
                     @"areaId"      :[paramsData stringWithKey:@"areaId" defaultValue:@"0"],
                     @"page"        :[NSNumber numberWithInt:currentPage],
                     @"pageSize"    :@"10",
                     @"category"    :[paramsData stringWithKey:@"category" defaultValue:@"0"],
                     @"sort"        :[paramsData stringWithKey:@"sort" defaultValue:@"default"],
                     @"type"        :@"all",
                     @"search"      :@""
                     };
    Log(@"请求参数 %@", request.data);
    HttpResponse *response = [Http post:request];
    Data *data = [Data new];
    data.source = [response.data mutableCopy];
    data.error = response.error;
    if (data.isSuccess) {
        NSMutableDictionary *source = [data.source mutableCopy];
        NSMutableDictionary *respData = [data.source[@"respData"] mutableCopy];
        [respData setObject:[NSNumber numberWithInt:currentPage] forKey:@"pageCurrent"];
        [source setObject:respData forKey:@"respData"];
        data.source = source;
    }
    return data;
}


@end
