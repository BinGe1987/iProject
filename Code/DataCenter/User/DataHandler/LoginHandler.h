//
//  LoginHandler.h
//  YDD
//
//  Created by BinGe on 2018/12/5.
//

#import "DataHandler.h"

NS_ASSUME_NONNULL_BEGIN

///自动登录
#define Operation_Login_check (@"Operation_Login_check")

@interface LoginHandler : DataHandler<HandlerDelegate>

@end

NS_ASSUME_NONNULL_END
