//
//  ComponentData.m
//  APP
//
//  Created by BinGe on 2018/12/25.
//

#import "ComponentData.h"

@implementation ComponentData

- (void)setData:(Data *)data {
    [super setData:data];
    self.isHead = [data integerWithKey:@"isHead"];
    self.componentID = [data stringWithKey:@"id"];
    self.type = [data stringWithKey:@"type"];
    self.name = [data stringWithKey:@"name"];
    self.title = [data stringWithKey:@"title"];
}

@end
