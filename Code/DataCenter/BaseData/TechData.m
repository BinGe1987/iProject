//
//  TechData.m
//  APP
//
//  Created by BinGe on 2018/12/25.
//

#import "TechData.h"

@implementation TechData

- (void)setData:(Data *)data {
    [super setData:data];
    self.techID = [data stringWithKey:@""];
    self.imageUrl = [data stringWithKey:@"techAvatar"];
    self.number = [data stringWithKey:@"serialNo"];
    self.name = [data stringWithKey:@"name"];
}

@end
