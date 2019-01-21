//
//  MenberData.m
//  APP
//
//  Created by BinGe on 2019/1/3.
//

#import "MemberData.h"

@implementation MemberData

- (void)setData:(Data *)data {
    [super setData:data];
    self.level = [data integerWithKey:@"memberLevel"];
    self.title = [data stringWithKey:@"memberTitle"];
    self.remainDays = [data integerWithKey:@"remainDays"];
}

@end
