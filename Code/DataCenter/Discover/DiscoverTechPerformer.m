//
//  DiscoverTechPerformer.m
//  APP
//
//  Created by BinGe on 2018/12/27.
//

#import "DiscoverTechPerformer.h"

@implementation DiscoverTechPerformer

- (id)perform:(id)operation params:(id)params callback:(ICallback)callback {
    HttpRequest *request = [HttpRequest withHost:[URLConstant host] api:API_HomeTech];
    request.data = @{@"token":DataCenter.token};
    HttpResponse *response = [Http post:request];
    Data *data = [Data new];
    data.source = response.data;
    data.error = response.error;
    return data;
}

@end
