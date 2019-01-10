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
    self.techID = [data stringWithKeys:@[@"techId",@"id"]];
    self.imageUrl = [data stringWithKey:@"techAvatar"];
    self.number = [data stringWithKey:@"serialNo"];
    self.name = [data stringWithKey:@"name"];
    self.browseNum = [data stringWithKey:@"browseNum"];
    self.commentNum = [data stringWithKeys:@[@"commentNum", @"commentCount"]];
    self.followNum = [data stringWithKey:@"favoriteNum"];
    self.phone = [data stringWithKey:@"phoneNum"];
    self.status = [data stringWithKey:@"status"];
    self.gender = [data stringWithKey:@"gender"];
    self.score = [data stringWithKey:@"score"];
    self.clubId = [data stringWithKey:@"clubId"];
    
    NSMutableArray *imageArray = [NSMutableArray new];
    NSArray *array = [data arrayWithKey:@"imgList"];
    for (Data *imageData in array) {
        [imageArray addObject:[ImageData withData:imageData]];
    }
    self.images = imageArray;
}

@end
