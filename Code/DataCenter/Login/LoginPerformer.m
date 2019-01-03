//
//  LoginPerformer.m
//  APP
//
//  Created by BinGe on 2019/1/3.
//

#import "LoginPerformer.h"

@implementation LoginPerformer

- (id)perform:(_Nonnull id)operation params:(_Nullable id)params callback:(_Nullable ICallback)callback {
    
    NSMutableDictionary *dict = [params mutableCopy];
    [dict setObject:@"ios" forKey:@"Channel"];
    
    NSString *url = [URLConstant URLWithApi:API_Login];
    HttpRequest *request = [HttpRequest new];
    request.url = url;
    request.data = dict;
    HttpResponse *response = [Http post:request];
    Data *data = [Data new];
    data.source = response.data;
    data.error = response.error;
    return data;
}

@end
