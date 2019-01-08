//
//  DiscoverTechData.m
//  APP
//
//  Created by BinGe on 2019/1/8.
//

#import "DiscoverTechData.h"

@implementation DiscoverTechData

- (void)setData:(Data *)data {
    [super setData:data];
    self.tech = [TechData withData:data];
    self.tech.name = [data stringWithKey:@"techName"];
    self.club = [ClubData withData:data];
    self.club.name = [data stringWithKey:@"clubName"];
}

@end
