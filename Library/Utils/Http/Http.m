//
//  Http.m
//  APP
//
//  Created by BinGe on 2019/1/3.
//

#import "Http.h"

@implementation Http

+ (HttpResponse *)post:(HttpRequest *)request {
    HttpResponse *httpResponse = [HttpResponse new];
    httpResponse.url = request.url;
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0); //创建信号量
    [Http post:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (!error) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
            httpResponse.data = dict;
        } else {
            httpResponse.error = error;
        }
        dispatch_semaphore_signal(semaphore);//发送信号
    }];
    dispatch_semaphore_wait(semaphore,DISPATCH_TIME_FOREVER);  //等待
    
    return httpResponse;
}

+ (void)post:(HttpRequest * _Nullable)httpRequest completionHandler:(void (^)(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error))completionHandler {

    NSURL *url = [[NSURL alloc] initWithString:httpRequest.url];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    [request setTimeoutInterval:httpRequest.timeout];
    [request setAllHTTPHeaderFields:@{@"User-Agent": @"iOS-Client"}];
    NSString *bodyStr = @"user_name=admin&user_password=admin";
    NSData *bodyData = [bodyStr dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:bodyData];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:completionHandler];
    [task resume];
}

@end
