//
//  LoginModule.m
//  APP
//
//  Created by BinGe on 2018/12/24.
//

#import "LoginModule.h"

@implementation LoginModule

- (void)setup:(BuildConfiguration)buildConfiguration {
    NSDictionary *params = @{};
    [DataCenter perform:OperationLoginCheck params:params callback:^(id  _Nonnull operation, id  _Nullable data) {
        [self loginCheckCompleted];
    }];
}

- (void)loginCheckCompleted {
    
}

@end
