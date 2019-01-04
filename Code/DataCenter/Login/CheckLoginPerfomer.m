//
//  CheckLoginPerfomer.m
//  APP
//
//  Created by BinGe on 2018/12/11.
//

#import "CheckLoginPerfomer.h"
#import "NetRequest.h"

@implementation CheckLoginPerfomer

- (id)perform:(_Nonnull id)operation params:(_Nullable id)params callback:(_Nullable ICallback)callback {
    if ([NSString isEmpty:params]) {
        return [Data new];
    }
    NSString *url = [URLConstant URLWithApi:API_CheckLogin];
    HttpRequest *request = [HttpRequest new];
    request.timeout = 5;
    request.url = url;
    request.data = @{@"token":params};
    HttpResponse *response = [Http post:request];
    Data *data = [Data new];
    data.source = response.data;
    data.error = response.error;
    return data;
}

@end
