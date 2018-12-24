//
//  MainModule.h
//  APP
//
//  Created by BinGe on 2018/12/21.
//

#import "BaseModule.h"

NS_ASSUME_NONNULL_BEGIN

@interface MainModule : BaseModule

- (void)getConfigurationFromServer;

- (void)getConfigurationCompleted:(ConfigData *)config;

@end

NS_ASSUME_NONNULL_END
