//
//  JError.m
//  YDD
//
//  Created by BinGe on 2018/12/4.
//

#import "JError.h"

@implementation JError

- (instancetype)initWithErrorInfo:(NSString *)info {
    return [self initWithErrorCode:0 errorInfo:info];
}

- (instancetype)initWithErrorCode:(NSInteger)code errorInfo:(NSString *)info {
    return [self initWithErrorCode:code errorInfo:info extra:@""];
}

- (instancetype)initWithErrorCode:(NSInteger)code errorInfo:(NSString *)info extra:(NSString *)extra {
    self = [super init];
    self.errorCode = code;
    self.errorInfo = info;
    self.extra = extra;
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"JError:error code %ld, error info %@, extra %@", self.errorCode, self.errorInfo,self.extra];
}

@end
