//
//  NetRequest.h
//  APP
//
//  Created by BinGe on 2018/12/18.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    RequestMethodGET,
    RequestMethodPOST
} RequestMethod;

NS_ASSUME_NONNULL_BEGIN

@interface NetRequest : NSObject

///请求的接口
- (NSDictionary *)requestUrl;
///请求的参数
- (NSDictionary *)requestParams;


///返回当前请求的方法（GET/POS），默认为POS
- (RequestMethod)requestMethod;
///超请的超时时间， 默认为10秒
- (NSTimeInterval)timeout;

@end

NS_ASSUME_NONNULL_END
