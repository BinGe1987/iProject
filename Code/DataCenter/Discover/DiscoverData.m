//
//  DiscoverData.m
//  APP
//
//  Created by BinGe on 2018/12/27.
//

#import "DiscoverData.h"

@implementation DiscoverData

- (void)initialize {
    self.club       = [[ListData alloc] init];
    self.tech       = [[ListData alloc] init];
}

- (void)setClubData:(Data *)data {
    
    if ([data isSuccess]) {
        Data *respData = [data dataWithKey:@"respData"];
        NSArray *club = [respData arrayWithKey:@"clubList"];
        [self.club clear];
        for (Data *clubData in club) {
            [self.club addData:[ClubData withData:clubData]];
        }
    }
}

- (void)addClubData:(Data *)data {
    Data *respData = [data dataWithKey:@"respData"];
    NSArray *club = [respData arrayWithKey:@"clubList"];
    for (Data *clubData in club) {
        [self.club addData:[ClubData withData:clubData]];
    }
}

- (void)setTechData:(Data *)data {
    [self.tech clear];
    if ([data isSuccess]) {
        Data *respData = [data dataWithKey:@"respData"];
        NSArray *techList = [respData arrayWithKey:@"list"];
        for (Data *dic in techList) {
            [self.tech addData:[TechData withData:dic]];
        }
        for (Data *dic in techList) {
            [self.tech addData:[TechData withData:dic]];
        }
        for (Data *dic in techList) {
            [self.tech addData:[TechData withData:dic]];
        }
    }
}

- (void)addTechData:(Data *)data {
    if ([data isSuccess]) {
        Data *respData = [data dataWithKey:@"respData"];
        NSArray *techList = [respData arrayWithKey:@"list"];
        for (Data *dic in techList) {
            [self.tech addData:[TechData withData:dic]];
        }
    }
}

@end
