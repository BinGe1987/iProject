//
//  TechDetailPerformer.m
//  APP
//
//  Created by BinGe on 2019/1/2.
//

#import "TechDetailPerformer.h"

@implementation TechDetailPerformer

- (id)perform:(id)operation params:(id)params callback:(ICallback)callback {
    TechData *tech = params;
    HttpRequest *request = [HttpRequest withHost:[URLConstant host] api:API_TechGeProfile];
    request.data = @{
                     @"token":DataCenter.token,
                     @"techId":tech.techID,
                     @"laty":@([DataCenter get].userData.laty),
                     @"lngx":@([DataCenter get].userData.lngx),
                     };
    HttpResponse *response = [Http post:request];
    Data *data = [Data new];
    data.source = [response.data mutableCopy];
    data.error = response.error;
    if (![data isSuccess]) {
        return data;
    }
    
    NSMutableDictionary *newSource = [data.source mutableCopy];
    Data *newData = [Data withDictionary:newSource];
    
    request = [HttpRequest withHost:[URLConstant host] api:API_TechGeComment];
    request.data = @{
                     @"token":DataCenter.token,
                     @"techId":tech.techID,
                     @"page":@"1",
                     @"pageSize":@"2",
                     @"type":@"selected",
                     };
    response = [Http post:request];
    data = [Data new];
    data.source = [response.data mutableCopy];
    data.error = response.error;
    
    if ([data isSuccess]) {
        Data *respData = [data dataWithKey:@"respData"];
        NSArray *list = respData.source[@"list"];
        [newData putObject:list forKey:@"commentList"];
    }
    
    return newData;
}

- (id)parse:(_Nonnull id)operation withSource:(id)source {
    TechDetailData *detail = [TechDetailData withData:source];
    return detail;
}


@end
