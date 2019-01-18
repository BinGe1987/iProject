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
    self.phone = [data stringWithKey:@"phoneNum"];
    self.status = [data stringWithKey:@"status"];
    self.gender = [data stringWithKey:@"gender"];
    self.clubId = [data stringWithKey:@"clubId"];
    
    self.score = [data floatWithKey:@"score"];
    self.browseNum = [data integerWithKey:@"browseNum"];
    self.commentNum = [data integerWithKeys:@[@"commentNum", @"commentCount"]];
    self.followNum = [data integerWithKey:@"favoriteNum"];
    self.isFollow = [data integerWithKey:@"isFollow"];
    
    NSMutableArray *imageArray = [NSMutableArray new];
    NSArray *array = [data arrayWithKey:@"imgList"];
    for (Data *imageData in array) {
        [imageArray addObject:[ImageData withData:imageData]];
    }
    self.images = imageArray;
}

@end
