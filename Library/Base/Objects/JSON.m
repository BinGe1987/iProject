//
//  JSON.m
//  
//
//  Created by BinGe on 2018/12/4.
//  Copyright © 2018. All rights reserved.
//

#import "JSON.h"

@implementation JSON

- (instancetype)initWithPath:(NSString *)path {
    self = [super init];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSError *error;
    id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    if (error) {
        Log(@"%@", error);
        self.error = error;
    } else {
        self.source = json;
    }
    return self;
}

@end
