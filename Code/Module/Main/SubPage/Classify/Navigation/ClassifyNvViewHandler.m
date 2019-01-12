//
//  ClassifyNvViewHandler.m
//  APP
//
//  Created by BinGe on 2019/1/8.
//

#import "ClassifyNvViewHandler.h"
#import "SearchController.h"

@implementation ClassifyNvViewHandler

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    
    UIView *titleView = [UIView viewWithXML:@"ClassifyNavigation.xml" size:view.bounds.size];
    [view addSubview:titleView];
    
    UIButton *search = [view findViewByName:@"btn_search"];
    [search setClickBlock:^(UIButton * _Nonnull button) {
        [SearchController open];
    }];
    
    return self;
}

@end
