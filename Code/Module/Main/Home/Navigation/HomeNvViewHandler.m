//
//  HomeNvViewHandler.m
//  APP
//
//  Created by BinGe on 2018/12/25.
//

#import "HomeNvViewHandler.h"
#import "SearchController.h"

@implementation HomeNvViewHandler

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    
    UIButton *search = [view findViewByName:@"btn_search"];
    [search setClickBlock:^(UIButton * _Nonnull button) {
        [SearchController open];
    }];
    
    UIButton *button = [self.view findViewByName:@"qr_code"];
    [button setClickBlock:^(UIButton * _Nonnull button) {
        [MVPViewController pushSelf];
    }];
    
    return self;
}

@end
