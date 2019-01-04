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
    
    UIButton *btnSetting = (UIButton *)[titleView findViewByName:@"setting"];
    [btnSetting setClickBlock:^(UIButton * _Nonnull button) {
        [UIViewController pushController:@"SettingController" animated:YES data:nil];
    }];
    
    UIButton *button = (UIButton *)[titleView findViewByName:@"qr_code"];
    [button setClickBlock:^(UIButton * _Nonnull button) {
        [UIViewController pushController:@"PayQRCodeController" animated:YES data:nil];
    }];
    
    return self;
}

@end
