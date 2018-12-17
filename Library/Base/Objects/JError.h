//
//  JError.h
//  YDD
//
//  Created by BinGe on 2018/12/4.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JError : NSObject
///错误码
@property (nonatomic, assign) NSInteger errorCode;

///错误信息
@property (nonatomic, strong) NSString *errorInfo;

///附加信息（如错误的url）
@property (nonatomic, strong) NSString *extra;

- (instancetype)initWithErrorInfo:(NSString *)info;

- (instancetype)initWithErrorCode:(NSInteger)code errorInfo:(NSString *)info;

- (instancetype)initWithErrorCode:(NSInteger)code errorInfo:(NSString *)info extra:(NSString *)extra;


@end

NS_ASSUME_NONNULL_END
