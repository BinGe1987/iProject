//
//  CommentCagetoryData.m
//  APP
//
//  Created by BinGe on 2019/1/10.
//

#import "CommentCagetoryData.h"

@implementation CommentCagetoryData

- (void)setData:(Data *)data {
    [super setData:data];
    self.type =         [data stringWithKey:@"commentType"];
    self.isLock =       [data integerWithKey:@"isLook"];
    self.commentCount = [data integerWithKey:@"categoryCount"];
    self.name =         [data stringWithKey:@"commentTypeText"];
    
    if (!self.name) {
        if ([self.type isEqualToString:@"common"]) {
            self.name = @"全部";
        }
        else if ([self.type isEqualToString:@"high"]) {
            self.name = @"优质";
        }
        else if ([self.type isEqualToString:@"selected"]) {
            self.name = @"精选";
        }
    }
}

@end
