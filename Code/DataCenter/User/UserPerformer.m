//
//  UserPerformer.m
//  APP
//
//  Created by BinGe on 2019/1/3.
//

#import "UserPerformer.h"

@implementation UserPerformer

- (id)perform:(id)operation params:(id)params callback:(ICallback)callback {
    
    if (!params) {
        return [Data new];
    }
    
    HttpRequest *request = [HttpRequest withHost:[URLConstant host] api:API_MineGetMineData];
    request.data = @{@"token":DataCenter.token};
    HttpResponse *response = [Http post:request];
    Data *data = [Data new];
    data.source = [response.data mutableCopy];
    data.error = response.error;
    
    return data;
}


@end
