//
//  CommentData.m
//  APP
//
//  Created by BinGe on 2019/1/2.
//

#import "CommentData.h"

@implementation CommentData

- (void)setData:(Data *)data {
    [super setData:data];
    self.user = [UserData withData:data];
    self.club = [ClubData withData:data];
    self.tech = [TechData withData:data];
    
    self.commentId = [data stringWithKey:@"id"];
    self.content = [data stringWithKey:@"content"];
    self.createTime = [data stringWithKey:@"createTime"];
    self.commentType = [data stringWithKey:@"commentType"];
    self.likeCount = [data stringWithKey:@"like"];
    self.score = [data floatWithKey:@"score"];

    self.imageList = [ListData new];
    NSArray *imageList = [data arrayWithKey:@"imgList"];
    for (Data *img in imageList) {
        [self.imageList addData:[ImageData withData:img]];
    }
    
}

@end
