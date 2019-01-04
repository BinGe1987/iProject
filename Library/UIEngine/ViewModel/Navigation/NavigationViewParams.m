//
//  NavigationViewParams.m
//  APP
//
//  Created by BinGe on 2019/1/4.
//

#import "NavigationViewParams.h"

@implementation NavigationViewParams

-(instancetype)initWithModel:(id<UIModel>)model {
    self = [super initWithModel:model];
    if (self) {
        self.widthValueType = FULL;
        
        NSString *height = [model getString:@"view_height" defaultValue:@"44"];
        self.heightValueType = VALUE;
        if ([height hasSuffix:@"sp"]) {
            self.height = [[height substringToIndex:[height length] -2] floatValue] * SCREENSCALE;
        } else {
            self.height = [height floatValue];
        }
        self.height += STATUSBARHIEGHT;
    }
    return self;
}


@end
