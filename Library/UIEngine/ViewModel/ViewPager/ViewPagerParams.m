//
//  ViewPagerParams.m
//  APP
//
//  Created by BinGe on 2018/12/27.
//

#import "ViewPagerParams.h"

@implementation ViewPagerParams

-(instancetype)initWithModel:(id<UIModel>)model {
    self = [super initWithModel:model];
    self.orientation = ScrollOrientationHorizontal;
    return self;
}

@end
