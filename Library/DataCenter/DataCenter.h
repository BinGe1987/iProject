//
//  DataCenter.h
//  YDD
//
//  Created by BinGe on 2018/12/4.
//  Copyright © 2018 约多多. All rights reserved.
//


#import "CommonHandler.h"
#import "Data.h"
#import "SingletonDefine.h"

NS_ASSUME_NONNULL_BEGIN

@interface DataCenter : NSObject

typedef void (^Callback)(id operation, id data);

singleton_interface(DataCenter)

/// 操作处理请求入口
+ (void)perform:(_Nonnull id)operation params:(_Nullable id)params callback:(_Nullable ICallback)callbak;

/// 操作处理请求入口
- (void)perform:(_Nonnull id)operation params:(_Nullable id)params callback:(_Nullable ICallback)callbak;

- (Data *)getData:(_Nonnull Class)handlerClass;

@end

NS_ASSUME_NONNULL_END
