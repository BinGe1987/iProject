//
//  Net.m
//  APP
//
//  Created by BinGe on 2018/12/18.
//

#import "Net.h"

@implementation Net

+ (void)configure:(NetConfig *)config {
    
}

+ (NetResponse *)synchroRequest:(_Nullable id<NetRequest>)request {
    return [NetResponse new];
}

+ (void)asynchroRequest:(_Nullable id<NetRequest>)request completed:( void(^ _Nullable )(NetResponse * response))block {
    NetResponse *response = [NetResponse new];
    block(response);
}

@end
