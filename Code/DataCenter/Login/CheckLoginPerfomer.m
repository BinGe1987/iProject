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
    
    NSString *api = params[@"api"];
    NSString *url = [URLConstant URLWithApi:api];
    
    HttpRequest *request = [HttpRequest new];
    request.url = url;
    request.data = params;
    
    HttpResponse *response = [Http post:request];
    
    return nil;
}

@end
