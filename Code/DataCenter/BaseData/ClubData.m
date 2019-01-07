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
    self.imageUrl = [data stringWithKey:@"logoUrl"];
    
}

@end
