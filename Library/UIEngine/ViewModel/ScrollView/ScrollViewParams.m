//
//  ScrollViewParams.m
//  APP
//
//  Created by BinGe on 2018/12/13.
//

#import "ScrollViewParams.h"

@implementation ScrollViewParams

-(instancetype)initWithModel:(id<UIModel>)model {
    self = [super initWithModel:model];
    if (self) {
        NSString *orientation = [model getString:@"view_orientation" defaultValue:@"Horizontal"];
        if (orientation &&([orientation isEqualToString:@"Horizontal"]||[orientation isEqualToString:@"H"])) {
            self.orientation = ScrollOrientationHorizontal;
        } else {
            self.orientation = ScrollOrientationVertical;
        }
        NSString *scrollIndicator = [model getString:@"view_scrollIndicator" defaultValue:@"YES"];
        self.scrollIndicator = [scrollIndicator isEqualToString:@"YES"];
    }
    return self;
}

@end
