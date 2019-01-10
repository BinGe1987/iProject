//
//  DiscoverTechPerformer.m
//  APP
//
//  Created by BinGe on 2018/12/27.
//

#import "DiscoverTechPerformer.h"

@implementation DiscoverTechPerformer


static int page;
- (id)perform:(id)operation params:(id)params callback:(ICallback)callback {
    
    if ([operation isEqualToString:OperationGetDiscoverTechData]) {
        page = 1;
    } else {
        page += 1;
    }
    
    NSString *api;
    if ([params integerValue] == 0) {
        api = API_DiscoverTechHot;
    } else {
        api = API_DiscoverTechTop;
    }
    HttpRequest *request = [HttpRequest withHost:[URLConstant host] api:api];
    request.data = @{@"token":DataCenter.token,
                     @"page":@(page),
                     @"pageSize":@"10",
                     @"techCount":@"0"
                     };
    HttpResponse *response = [Http post:request];
    Data *data = [Data new];
    data.source = [response.data mutableCopy];
    data.error = response.error;
    return data;
}

@end
