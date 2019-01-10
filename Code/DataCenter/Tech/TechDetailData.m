//
//  TechDetailData.m
//  APP
//
//  Created by BinGe on 2019/1/2.
//

#import "TechDetailData.h"

@implementation TechDetailData

- (void)setData:(Data *)data {
    [super setData:data];
    Data *respData = [data dataWithKey:@"respData"];
    [respData putObject:@"" forKey:@"clubId"];
    self.techData = [TechData withData:respData];
    self.clubData = [ClubData withData:respData];
    
}

@end
