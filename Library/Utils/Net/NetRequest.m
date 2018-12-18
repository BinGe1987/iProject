//
//  NetRequest.m
//  APP
//
//  Created by BinGe on 2018/12/18.
//

#import "NetRequest.h"

@implementation NetRequest

///请求的接口
- (NSString *)url {
    return nil;
}
///请求的参数
- (NSDictionary *)params {
    return nil;
}


///返回当前请求的方法（GET/POS），默认为POS
- (RequestMethod)method {
    return RequestMethodPOST;
}
///超请的超时时间， 默认为10秒
- (NSTimeInterval)timeout {
    return 10;
}

@end
