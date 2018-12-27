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
    
    [self currentSelected:0];
    
    return self;
}

- (void)currentSelected:(NSInteger)index {
    UIButton *clubBtn = (UIButton *)[self.view findViewByName:@"club"];
    UIButton *techBtn = (UIButton *)[self.view findViewByName:@"tech"];
    switch (index) {
        case 0:
            clubBtn.selected = YES;
            techBtn.selected = NO;
            break;
        case 1:
            clubBtn.selected = NO;
            techBtn.selected = YES;
            break;
        default:
            break;
    }
}

@end
