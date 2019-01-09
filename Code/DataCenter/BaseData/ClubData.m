//
//  ClubData.m
//  APP
//
//  Created by BinGe on 2018/12/25.
//

#import "ClubData.h"

@implementation ClubData

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.bannerList = [ListData new];
    }
    return self;
}

- (void)setData:(Data *)data {
    [super setData:data];
    self.clubID = [data stringWithKeys:@[@"clubId",@"id"]];
    self.name = [data stringWithKeys:@[@"name", @"clubName"]];
    self.address = [data stringWithKey:@"address"];
    self.startTime = [data stringWithKey:@"businessStart"];
    self.category = [data stringWithKey:@"category"];
    self.endTime = [data stringWithKey:@"businessEnd"];
    self.imageUrl = [data stringWithKey:@"logoUrl"];
    self.regionName = [data stringWithKey:@"regionName"];
    self.areaName = [data stringWithKey:@"areaName"];
    self.tag = [data stringWithKey:@"tag"];
    self.star = [data stringWithKey:@"star"];
    self.consumeAvg = [data stringWithKey:@"consumeAvg"];
    self.consumeCount = [data stringWithKeys:@[@"consumeCount"]];
    self.commentNum = [data stringWithKeys:@[@"commentNum", @"commentCount"]];
    self.distance = [data stringWithKey:@"distance"];
    self.discount = [data floatWithKey:@"discount"];
    self.clubDiscount = [data floatWithKey:@"clubDiscount"];
    self.laty = [data floatWithKey:@"laty"];
    self.lngx = [data floatWithKey:@"lngx"];
    self.followCount = [data integerWithKey:@"followCount"];
    self.isFollow = [data integerWithKey:@"isFollow"];
    self.serviceCount = [data integerWithKey:@"serviceCount"];
    self.techCount = [data integerWithKey:@"techCount"];
    self.telPhone = [data stringWithKey:@"telPhone"];
    
    NSArray *bannerList = [data arrayWithKey:@"imgList"];
    for (Data *bannerData in bannerList) {
        BannerData *banner = [BannerData withData:bannerData];
        [self.bannerList addData:banner];
    }
}

@end
