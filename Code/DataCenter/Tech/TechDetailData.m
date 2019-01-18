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
    self.techData = [TechData withData:respData];
    self.clubData = [ClubData withData:respData];
    self.clubData.isFollow = 0;
    
    self.commentList = [NSMutableArray new];
    NSArray *commentList = [data arrayWithKey:@"commentList"];
    for (Data *data in commentList) {
        [self.commentList addObject:[CommentData withData:data]];
    }
    
}

@end
