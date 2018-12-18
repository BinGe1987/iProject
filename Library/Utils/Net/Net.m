//
//  Net.m
//  APP
//
//  Created by BinGe on 2018/12/18.
//

#import "Net.h"


@implementation Net

singleton_implementation(Net)

- (void)initialize {
    
}

+ (void)configure:(NetConfig *)config {
    [Net get].config = config;
}

///同步
+ (NetResponse *)synchroRequest:( NetRequest * _Nullable )request {
    NetResponse *netResponse = [NetResponse new];
    switch (request.requestMethod) {
        default:
        case RequestMethodPOST:{
            dispatch_semaphore_t semaphore = dispatch_semaphore_create(0); //创建信号量
            [Net post:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                if (!error) {
                    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
                    netResponse.data = dict;
                } else {
                    netResponse.error = error;
                }
                dispatch_semaphore_signal(semaphore);//发送信号
            }];
            dispatch_semaphore_wait(semaphore,DISPATCH_TIME_FOREVER);  //等待
        }
            break;
        case RequestMethodGET:
            break;
    }
    return netResponse;
}

///异步
+ (void)asynchroRequest:(NetRequest *)request completed:( void(^ _Nullable )(NetResponse * response))block {
    NetResponse *response = [NetResponse new];
    block(response);
    NetResponse *netResponse = [NetResponse new];
    switch (request.requestMethod) {
        default:
        case RequestMethodPOST:{
            [Net post:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                if (!error) {
                    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
                    netResponse.data = dict;
                } else {
                    netResponse.error = error;
                }
                block(netResponse);
            }];
        }
            break;
        case RequestMethodGET:
            break;
    }
}

+ (void)post:( NetRequest * _Nullable)netRequest completionHandler:(void (^)(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error))completionHandler;{
    
    NetConfig *config = [Net get].config;
    NSString *urlString = [NSString stringWithFormat:@"%@%@", config.baseUrl, netRequest.requestUrl];
    NSURL *url = [[NSURL alloc] initWithString:urlString];

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    [request setTimeoutInterval:netRequest.timeout>0?netRequest.timeout:10];
    [request setAllHTTPHeaderFields:@{@"User-Agent": @"iOS-Client"}];
    NSString *bodyStr = @"user_name=admin&user_password=admin";
    NSData *bodyData = [bodyStr dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:bodyData];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:completionHandler];
    [task resume];
}

@end
