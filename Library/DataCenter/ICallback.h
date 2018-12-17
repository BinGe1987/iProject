//
//  ICallback.h
//  YDD
//
//  Created by BinGe on 2018/12/4.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^ICallback)(_Nonnull id operation, _Nullable id data);

/**
  DataCenter处理完操作后会回调实现此接口的使用者
 */
@protocol ICallback <NSObject>
//
//- (void)onCallbac:(id)operation data:(id)data;

@end

NS_ASSUME_NONNULL_END
