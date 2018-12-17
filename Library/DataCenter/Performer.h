//
//  Performer.h
//  APP
//
//  Created by BinGe on 2018/12/11.
//

#import <Foundation/Foundation.h>
#import "ICallback.h"

@protocol IPerformer <NSObject>


/**
 处理操作
 
 @param operation  操作类型
 @param params 操作的参数
 @param callback 操作后回调
 @return 操作后返回data数据
 */
- (id)perform:(_Nonnull id)operation params:(_Nullable id)params callback:(_Nullable ICallback)callback;


/**
 使用同步还是异步执行操作处理
 
 @return YES异步/NO同步
 */
- (BOOL)isAsynchronous;

@end

NS_ASSUME_NONNULL_BEGIN

@interface Performer : NSObject<IPerformer>

@end

NS_ASSUME_NONNULL_END
