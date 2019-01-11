//
//  SearchPresenter.m
//  APP
//
//  Created by BinGe on 2019/1/12.
//

#import "SearchPresenter.h"
#import "SearchViewHandler.h"

@implementation SearchPresenter

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    self.handler = [[SearchViewHandler alloc] initWithView:view];
    return self;
}



@end
