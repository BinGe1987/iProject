//
//  LinearViewParams.m
//  APP
//
//  Created by BinGe on 2018/12/10.
//

#import "LinearLayoutViewParams.h"

@implementation LinearLayoutViewParams

-(instancetype)initWithModel:(id<UIModel>)model {
    self = [super initWithModel:model];
    if (self) {
        NSString *orientation = [model getString:@"view_orientation" defaultValue:@"h"];
        if (orientation &&([orientation isEqualToString:@"horizontal"]||[orientation isEqualToString:@"H"]||[orientation isEqualToString:@"h"])) {
            self.orientation = OrientationHorizontal;
        } else {
            self.orientation = OrientationVertical;
        }
    }
    return self;
}

@end
