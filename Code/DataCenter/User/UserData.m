//
//  UserData.m
//  APP
//
//  Created by BinGe on 2018/12/10.
//

#import "UserData.h"

@implementation UserData

- (void)setData:(Data *)data {
    [super setData:data];
    JSON *json = [data jsonWithKey:@"respData"];
    self.token = [json stringWithKey:@"token"];
}

- (BOOL)isLogin {
    return self.isSuccess;
}

@end
