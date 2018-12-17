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
    if ([path length] == 0) {
        self.error = [[JError alloc] initWithErrorInfo:[NSString stringWithFormat:@"Json文件不存在 %@", path]];
    } else {
        NSData *data = [NSData dataWithContentsOfFile:path];
        NSError *error;
        id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
        if (error) {
            self.error = [[JError alloc] initWithErrorInfo:[NSString stringWithFormat:@"Json文件解析失败 %@", error.localizedDescription]];
        }
        self.source = json;
    }
    if (self.error) {
        Log(@"%@", self.error);
    }
    return self;
}

@end
