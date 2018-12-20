//
//  FrameLayoutParams.m
//  UIEngine
//
//  Created by BinGe on 2018/11/28.
//  Copyright © 2018 Bin. All rights reserved.
//

#import "FrameLayoutParams.h"

@implementation FrameLayoutParams

-(instancetype)initWithModel:(id<UIModel>)model {
    self = [super initWithModel:model];
    if (self) {
        NSString *gravityValue = [model getString:@"layout_gravity" defaultValue:@"left|top"];
        //去空格，按"|" 拆分为数组
        NSArray  *array = [[gravityValue stringByReplacingOccurrencesOfString:@" " withString:@""]
                           componentsSeparatedByString:@"|"];
        for (NSString *g in array) {
            Log(@"%@", g);
            if ([g isEqualToString:@"center"]) {
                self.gravity |= FrameLayoutGravityCenter;
            }
            else if ([g isEqualToString:@"left"]) {
                self.gravity |= FrameLayoutGravityLeft;
            }
            else if ([g isEqualToString:@"top"]) {
                self.gravity |= FrameLayoutGravityTop;
            }
            else if ([g isEqualToString:@"right"]) {
                self.gravity |= FrameLayoutGravityRight;
            }
            else if ([g isEqualToString:@"bottom"]) {
                self.gravity |= FrameLayoutGravityBottom;
            }
            else {
                Log(@"wrong gravity : %@", g);
            }
        }
        
    }
    return self;
}

@end
