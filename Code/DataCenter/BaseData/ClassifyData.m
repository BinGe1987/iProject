//
//  ClassifyData.m
//  APP
//
//  Created by BinGe on 2018/12/25.
//

#import "ClassifyData.h"

@implementation ClassifyData

- (void)setData:(Data *)data {
    [super setData:data];
    self.ID = [data stringWithKey:@"id"];
    self.name = [data stringWithKey:@"name"];
    self.imageUrl = [data stringWithKey:@"imageUrl"];
}

@end
