//
//  ClubData.m
//  APP
//
//  Created by BinGe on 2018/12/25.
//

#import "ClubData.h"

@implementation ClubData

- (void)setData:(Data *)data {
    [super setData:data];
    self.clubID = [data stringWithKey:@"id"];
    self.name = [data stringWithKey:@"name"];
    self.imageUrl = [data stringWithKey:@"logoUrl"];
    self.regionName = [data stringWithKey:@"regionName"];
    self.areaName = [data stringWithKey:@"areaName"];
    self.tag = [data stringWithKey:@"tag"];
    self.star = [data stringWithKey:@"star"];
    self.consumeAvg = [data stringWithKey:@"consumeAvg"];
    self.consumeCount = [data stringWithKey:@"consumeCount"];
    self.commentNum = [data stringWithKey:@"commentNum"];
    self.distance = [data stringWithKey:@"distance"];
    self.discount = [data floatWithKey:@"discount"];
    self.clubDiscount = [data floatWithKey:@"clubDiscount"];
    self.laty = [data floatWithKey:@"laty"];
    self.lngx = [data floatWithKey:@"lngx"];
}

@end
