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
        if (error) {
            NSLog(@"post error :%@",error.localizedDescription);
            httpResponse.error = error;
        }else {
            // 如果请求成功，则解析数据。
            id object = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
            // 11、判断是否解析成功
            if (error) {
                NSLog(@"post error :%@",error.localizedDescription);
                httpResponse.error = error;
            }else {
                // 解析成功，处理数据，通过GCD获取主队列，在主线程中刷新界面。
                NSLog(@"post success :%@",object);
                httpResponse.data = object;
            }
        }
        dispatch_semaphore_signal(semaphore);//发送信号
    }];
    dispatch_semaphore_wait(semaphore,DISPATCH_TIME_FOREVER);  //等待
    return httpResponse;
}

+ (void)post:(HttpRequest * _Nullable)httpRequest completionHandler:(void (^)(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error))completionHandler {
    NSURL *url = [[NSURL alloc] initWithString:httpRequest.url];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setTimeoutInterval:httpRequest.timeout];
    [request setHTTPMethod:@"POST"];
    [request addValue:@"gzip" forHTTPHeaderField:@"Content-Encoding"];
    NSDictionary *parametersDict = httpRequest.data;
    NSMutableString *parameterString = [[NSMutableString alloc] init];
    int pos =0;
    for (NSString *key in parametersDict.allKeys) {
        [parameterString appendFormat:@"%@=%@", key, parametersDict[key]];
        if(pos<parametersDict.allKeys.count - 1){
            [parameterString appendString:@"&"];
        }
        pos++;
    }
    NSData *parametersData = [parameterString dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:parametersData];
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:completionHandler];
    [task resume];
}

@end
