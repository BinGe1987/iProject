//
//  Http.m
//  APP
//
//  Created by BinGe on 2019/1/3.
//

#import "Http.h"
#import "Network.h"

@implementation Http

+ (HttpResponse *)post:(HttpRequest *)request {
    HttpResponse *httpResponse = [HttpResponse new];
    httpResponse.url = request.requestURL;
    
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0); //创建信号量
    [Http post:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            httpResponse.error = [Http errorMsg:error];
        }else {
            // 如果请求成功，则解析数据。
            id object = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
            // 11、判断是否解析成功
            if (error) {
                NSLog(@"post error : %@",error);
                httpResponse.error = error;
            }else {
                // 解析成功，处理数据，通过GCD获取主队列，在主线程中刷新界面。
//                NSLog(@"post success :%@",object);
                httpResponse.data = object;
                if ([object[@"statusCode"] integerValue] != 200) {
                    NSLog(@"\n=============================================");
                    NSLog(@"post error request  : %@", request);
                    NSLog(@"post error response : %@", httpResponse);
                    NSLog(@"\n=============================================");
                }
            }
        }
        dispatch_semaphore_signal(semaphore);//发送信号
    }];
    dispatch_semaphore_wait(semaphore,DISPATCH_TIME_FOREVER);  //等待
    return httpResponse;
}

+ (void)post:(HttpRequest * _Nullable)httpRequest completionHandler:(void (^)(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error))completionHandler {
    NSURL *url = [[NSURL alloc] initWithString:httpRequest.requestURL];
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

+ (NSError *)errorMsg:(NSError *)error {
    switch (error.code) {
        default:
        case NSURLErrorUnknown:
            return [NSError errorWithDomain:@"未知URL错误" code:error.code userInfo:nil];
        case NSURLErrorBadURL:
            return [NSError errorWithDomain:@"无效的URL地址" code:error.code userInfo:nil];
        case NSURLErrorCannotFindHost:
            return [NSError errorWithDomain:@"找不到服务器" code:error.code userInfo:nil];
        case NSURLErrorTimedOut:
            return [NSError errorWithDomain:@"服务器连接超时" code:error.code userInfo:nil];
        case NSURLErrorUnsupportedURL:
            return [NSError errorWithDomain:@"不支持此URL" code:error.code userInfo:nil];
        case NSURLErrorCannotConnectToHost:
            return [NSError errorWithDomain:@"无法连接到服务器" code:error.code userInfo:nil];
        case NSURLErrorNetworkConnectionLost:
            return [NSError errorWithDomain:@"网络连接异常" code:error.code userInfo:nil];
        case NSURLErrorResourceUnavailable:
            return [NSError errorWithDomain:@"无网络，请检查设置" code:error.code userInfo:nil];
        case NSURLErrorNotConnectedToInternet:
            return [NSError errorWithDomain:@"无效网络，请检查设置" code:error.code userInfo:nil];
        case NSURLErrorBadServerResponse:
            return [NSError errorWithDomain:@"服务器无响应" code:error.code userInfo:nil];
            
    }
}

+ (HttpResponse *)uploadImageRequest:(HttpRequest *)httpRequest {
    
    HttpResponse *httpResponse = [HttpResponse new];
    
    UIImage *image = httpRequest.uploadImage;
    NSString *url = httpRequest.requestURL;
    NSDictionary *params = httpRequest.data;
    
    NSString *TWITTERFON_FORM_BOUNDARY = @"0xKhTmLbOuNdArY";
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10];
    //分界线 --AaB03x
    NSString *MPboundary=[[NSString alloc]initWithFormat:@"--%@",TWITTERFON_FORM_BOUNDARY];
    //结束符 AaB03x--
    NSString *endMPboundary=[[NSString alloc]initWithFormat:@"%@--",MPboundary];
    //得到图片的data
    NSData* data;
    //判断图片是不是png格式的文件
    NSString *imageName = nil;
    NSString *type = params[@"name"] ? params[@"name"] : @"pic";
    if (UIImagePNGRepresentation(image)) {
        //返回为png图像。
        data = UIImagePNGRepresentation(image);
        imageName = [NSString stringWithFormat:@"%@.png",type];
    }else {
        //返回为JPEG图像。
        data = UIImageJPEGRepresentation(image, 1.0);
        imageName = [NSString stringWithFormat:@"%@.jpg",type];
    }
    //    User *user = [User getInstance];
    NSMutableString *body=[[NSMutableString alloc]init];
    
    for (NSString *key in [params allKeys]) {
        [body appendFormat:@"%@\r\n",MPboundary];
        [body appendFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n",key];
        [body appendFormat:@"%@\r\n",params[key]];
    }
    
    [body appendFormat:@"%@\r\n",MPboundary];
    [body appendFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"%@\"\r\n",@"imageFile",imageName];
    [body appendFormat:@"Content-Type: image/jpge,image/gif, image/jpeg, image/pjpeg, image/pjpeg\r\n\r\n"];
    
    NSString *end=[[NSString alloc]initWithFormat:@"\r\n%@",endMPboundary];
    NSMutableData *requestData=[NSMutableData data];
    [requestData appendData:[body dataUsingEncoding:NSUTF8StringEncoding]];
    [requestData appendData:data];
    [requestData appendData:[end dataUsingEncoding:NSUTF8StringEncoding]];
    NSString *content=[[NSString alloc]initWithFormat:@"multipart/form-data; boundary=%@",TWITTERFON_FORM_BOUNDARY];
    [request setValue:content forHTTPHeaderField:@"Content-Type"];
    [request setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[requestData length]] forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody:requestData];
    [request setHTTPMethod:@"POST"];
    
    //3.创建网络会话
    NSURLSession *session=[NSURLSession sharedSession];
    
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0); //创建信号量
    //4.创建网络上传任务
    NSURLSessionUploadTask *dataTask=[session uploadTaskWithRequest:request fromData:requestData completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            httpResponse.error = [Http errorMsg:error];
        }else {
            // 如果请求成功，则解析数据。
            id object = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
            // 11、判断是否解析成功
            if (error) {
                NSLog(@"post error :%@",error.localizedDescription);
                httpResponse.error = error;
            }else {
                // 解析成功，处理数据，通过GCD获取主队列，在主线程中刷新界面。
                //                NSLog(@"post success :%@",object);
                httpResponse.data = object;
            }
        }
        dispatch_semaphore_signal(semaphore);//发送信号
    }];
    
    //5.发送网络任务
    [dataTask resume];
    dispatch_semaphore_wait(semaphore,DISPATCH_TIME_FOREVER);  //等待
    
    return httpResponse;
}

@end
