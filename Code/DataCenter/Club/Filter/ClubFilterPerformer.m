//
//  ClubFilterPerformer.m
//  APP
//
//  Created by BinGe on 2019/1/8.
//

#import "ClubFilterPerformer.h"

@implementation ClubFilterPerformer

- (id)perform:(id)operation params:(id)params callback:(ICallback)callback {
    
    HttpRequest *request = [HttpRequest withHost:[URLConstant host] api:API_ClubGetFilters];
    request.data = @{@"token":DataCenter.token};
    HttpResponse *response = [Http post:request];
    Data *data = [Data new];
    data.source = [response.data mutableCopy];
    data.error = response.error;
    return data;
}

- (id)parse:(_Nonnull id)operation withSource:(id)source {
    if ([source isSuccess]) {
//        ListData *areaList = [ListData new];
        Data *respData = [source dataWithKey:@"respData"] ;
//        NSArray *areaList = [respData arrayWithKey:@"areaList"];;
//        NSLog(@"%@",areaList);
        return respData;
    }
    return source;
}

@end
