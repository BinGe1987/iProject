//
//  BannerData.m
//  APP
//
//  Created by BinGe on 2018/12/25.
//

#import "BannerData.h"

@implementation BannerData

- (void)setData:(Data *)data {
    [super setData:data];
    self.bannerID = [data stringWithKey:@"id"];
    self.imageUrl = [data stringWithKey:@"imageUrl"];
}

@end
