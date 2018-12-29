//
//  HomeNvViewHandler.m
//  APP
//
//  Created by BinGe on 2018/12/25.
//

#import "HomeNvViewHandler.h"

@implementation HomeNvViewHandler

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    
    UIView *titleView = [UIView viewWithJSON:@"HomeNavigation.json" size:view.bounds.size];
    [view addSubview:titleView];
    
    UIButton *button = (UIButton *)[titleView findViewByName:@"qr_code"];
    [button setClickBlock:^(UIButton * _Nonnull button) {
        [MVPViewController pushSelf];
    }];
    
    return self;
}

@end
