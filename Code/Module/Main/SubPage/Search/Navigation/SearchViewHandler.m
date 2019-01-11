//
//  SearchViewHandler.m
//  APP
//
//  Created by BinGe on 2019/1/12.
//

#import "SearchViewHandler.h"

@implementation SearchViewHandler

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    [self searchAnimation];
    return self;
}

- (void)searchAnimation {
    UIView *cancel = [self.view findViewByName:@"btn_cancel"];
    [UIView animateWithDuration:0.3 animations:^{
        CGRect rect = cancel.frame;
        rect.origin.x -= 60;
        cancel.frame = rect;
    }];
    UIView *qrCode = [self.view findViewByName:@"qr_code"];
    [UIView animateWithDuration:0.3 animations:^{
        qrCode.alpha = 0;
    }];
    UIView *location = [self.view findViewByName:@"layout_location"];
    [UIView animateWithDuration:0.3 animations:^{
        CGRect rect = location.frame;
        rect.origin.x -= 84;
        location.frame = rect;
    }];
    
    UIView *search = [self.view findViewByName:@"layout_search"];
    [UIView animateWithDuration:0.3 animations:^{
        CGRect rect = search.frame;
        rect.size.width += rect.origin.x;
        rect.size.width -= 10;
        rect.origin.x = 15;
        search.frame = rect;
    }];
    
    UIView *icon = [self.view findViewByName:@"icon"];
    [UIView animateWithDuration:0.3 animations:^{
        CGRect rect = icon.frame;
        rect.origin.x = 10;
        icon.frame = rect;
    }];
    
    UILabel *input = [self.view findViewByName:@"input"];
    [UIView animateWithDuration:0.3 animations:^{
        CGRect rect = input.frame;
        rect.origin.x += 10;
        rect.size.width -= 20;
        input.frame = rect;
        input.text = @"搜索人或角色名";
    }];
}

@end
