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

@interface Http : NSObject

+ (HttpResponse *)post:(HttpRequest *)request;

@end

NS_ASSUME_NONNULL_END
