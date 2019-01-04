//
//  PointsData.m
//  APP
//
//  Created by BinGe on 2019/1/3.
//

#import "PointsData.h"

@implementation PointsData

- (void)setData:(Data *)data {
    [super setData:data];
    JSON *json = [data jsonWithKey:@"respData"];
    self.nowPoints =  [json integerWithKey:@"nowPoints" defaultValue:0];
    self.monthPoints =  [json integerWithKey:@"monthPoints" defaultValue:0];
}

@end
