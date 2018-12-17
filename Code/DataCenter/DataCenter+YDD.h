//
//  DataCenter+YDD.h
//  APP
//
//  Created by BinGe on 2018/12/10.
//

#import "DataCenter.h"
#import "LoginHandler.h"
#import "UserHandler.h"
#import "HomeHandler.h"

NS_ASSUME_NONNULL_BEGIN

@interface DataCenter (YDD)

///获取用户信息
- (UserData *)getUserData;

@end

NS_ASSUME_NONNULL_END
