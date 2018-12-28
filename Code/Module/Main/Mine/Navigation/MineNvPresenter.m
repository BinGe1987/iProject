//
//  MineNvPresenter.m
//  APP
//
//  Created by BinGe on 2018/12/28.
//

#import "MineNvPresenter.h"

@implementation MineNvPresenter

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    
    UIView *titleView = [UIView viewWithJSON:@"MineNavigation.json" size:view.bounds.size];
    [view addSubview:titleView];
    
    UIButton *button = (UIButton *)[titleView findViewByName:@"qr_code"];
    [button setClickBlock:^(UIButton * _Nonnull button) {
        Log(@"12312312");
    }];
    
    return self;
}

@end
