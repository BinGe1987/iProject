//
//  VerifyCodePerformer.m
//  APP
//
//  Created by BinGe on 2019/1/3.
//

#import "VerifyCodePerformer.h"

@implementation VerifyCodePerformer

- (id)perform:(_Nonnull id)operation params:(_Nullable id)params callback:(_Nullable ICallback)callback {
    HttpRequest *request = [HttpRequest withHost:[URLConstant host] api:API_VerifyCode];
    request.data = @{@"which":@"userLogin", @"phoneNum":params };
    HttpResponse *response = [Http post:request];
    Data *data = [Data new];
    data.source = response.data;
    data.error = response.error;
    return data;
}

- (id)parse:(_Nonnull id)operation withSource:(id)source {
    return source;
}

@end
