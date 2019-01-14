//
//  NavigationItemViewParams.m
//  APP
//
//  Created by BinGe on 2019/1/14.
//

#import "NavigationItemViewParams.h"

@implementation NavigationItemViewParams

-(instancetype)initWithModel:(id<UIModel>)model {
    self = [super initWithModel:model];
    if (self) {
        self.widthValueType = FULL;
        self.heightValueType = FULL;
    }
    return self;
}

@end
