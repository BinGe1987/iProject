//
//  Http.h
//  APP
//
//  Created by BinGe on 2019/1/3.
//

#import <Foundation/Foundation.h>
#import "HttpRequest.h"
#import "HttpResponse.h"

NS_ASSUME_NONNULL_BEGIN

#define ERROR_CODE_NEWWORK_BROKEN       (101000)

@interface Http : NSObject

+ (HttpResponse *)post:(HttpRequest *)request;

+ (HttpResponse *)uploadImageRequest:(HttpRequest *)httpRequest;

@end

NS_ASSUME_NONNULL_END
