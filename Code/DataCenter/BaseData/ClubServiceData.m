//
//  ClubServiceData.m
//  APP
//
//  Created by BinGe on 2019/1/9.
//

#import "ClubServiceData.h"

@implementation ClubServiceData

- (void)setData:(Data *)data {
    [super setData:data];
    self.serviceID = [data stringWithKey:@"id"];
    self.name = [data stringWithKey:@"name"];
    self.imageUrl = [data stringWithKey:@"imgUrl"];
    self.unit = [data stringWithKey:@"unitName"];
    self.price = [data integerWithKey:@"price"];
    self.originalPrice = [data integerWithKey:@"originalPrice"];
    self.savePrice = [data integerWithKey:@"savePrice"];
    self.amount = [data integerWithKey:@"amount"];
}

@end
