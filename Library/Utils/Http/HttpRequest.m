//
//  HttpRequest.m
//  APP
//
//  Created by BinGe on 2019/1/3.
//

#import "HttpRequest.h"

@implementation HttpRequest

- (NSTimeInterval)timeout {
    return _timeout ? _timeout : 8;
}

@end
