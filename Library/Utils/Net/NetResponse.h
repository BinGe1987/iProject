//
//  NetResponse.h
//  APP
//
//  Created by BinGe on 2018/12/18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NetResponse : NSObject

@property (nonatomic, strong) NSString *url;

@property (nonatomic, strong) NSError *error;

@property (nonatomic, strong) NSDictionary *data;

@end

NS_ASSUME_NONNULL_END
