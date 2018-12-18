//
//  JSON.h
//  YDD
//
//  Created by BinGe on 2018/12/4.
//  Copyright © 2018 约多多. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JSON : NSObject

///错误信息
@property (nonatomic, strong) NSError *error;

@property (nonatomic, strong) NSDictionary *source;

- (instancetype)initWithPath:(NSString *)path;

@end

NS_ASSUME_NONNULL_END
