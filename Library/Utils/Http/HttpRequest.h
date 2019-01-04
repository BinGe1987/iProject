//
//  HttpRequest.h
//  APP
//
//  Created by BinGe on 2019/1/3.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HttpRequest : NSObject

@property (nonatomic, strong) NSString *url;

@property (nonatomic, strong) NSDictionary *data;

@property (nonatomic, assign) NSTimeInterval timeout;

@end

NS_ASSUME_NONNULL_END
