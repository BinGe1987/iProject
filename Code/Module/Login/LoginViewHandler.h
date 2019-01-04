//
//  LoginViewHandler.h
//  APP
//
//  Created by BinGe on 2018/12/30.
//

#import "ViewHandler.h"

NS_ASSUME_NONNULL_BEGIN

@interface LoginViewHandler : ViewHandler

- (void)loginSuccess:(UserData *)user;

- (void)loginError:(NSString *)error;

- (void)error:(NSString *)error;

@end

NS_ASSUME_NONNULL_END
