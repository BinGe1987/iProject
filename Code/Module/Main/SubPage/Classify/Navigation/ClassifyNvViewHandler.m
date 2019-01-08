//
//  ClassifyNvViewHandler.m
//  APP
//
//  Created by BinGe on 2019/1/8.
//

#import "ClassifyNvViewHandler.h"

@implementation ClassifyNvViewHandler

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    
    UIView *titleView = [UIView viewWithXML:@"ClassifyNavigation.xml" size:view.bounds.size];
    [view addSubview:titleView];
    
    UIView *search = [view findViewByName:@"search"];
    search.userInteractionEnabled = NO;
    
    return self;
}

@end
