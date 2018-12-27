//
//  DiscoverNvViewHandler.m
//  APP
//
//  Created by BinGe on 2018/12/27.
//

#import "DiscoverNvViewHandler.h"

@implementation DiscoverNvViewHandler

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    
    UIView *titleView = [UIView viewWithJSON:@"DiscoverNavigation.json" size:view.bounds.size];
    [view addSubview:titleView];
    
    return self;
}

@end
