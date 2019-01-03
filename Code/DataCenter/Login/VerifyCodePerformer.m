//
//  VerifyCodePerformer.m
//  APP
//
//  Created by BinGe on 2019/1/3.
//

#import "VerifyCodePerformer.h"

@implementation VerifyCodePerformer

- (id)perform:(_Nonnull id)operation params:(_Nullable id)params callback:(_Nullable ICallback)callback {
    
    
    NSString *url = [URLConstant URLWithApi:API_VerifyCode];
    
    HttpRequest *request = [HttpRequest new];
    request.url = url;
    request.data = @{@"which":@"userLogin",
                     @"phoneNum":params
                     };
    
    HttpResponse *response = [Http post:request];
    
    return nil;
}

- (id)parse:(_Nonnull id)operation withSource:(id)source {
    
    return nil;
}

@end
