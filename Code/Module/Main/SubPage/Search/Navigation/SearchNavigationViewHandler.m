//
//  SearchNavigationViewHandler.m
//  APP
//
//  Created by BinGe on 2019/1/12.
//

#import "SearchNavigationViewHandler.h"

@interface SearchNavigationViewHandler()

@property (nonatomic, copy) NSString *text;

@end

@implementation SearchNavigationViewHandler

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    [self searchAnimation];
    
    UIButton *button = [self.view findViewByName:@"btn_search"];
    [button setViewVisibility:ViewVisibilityInvisible];
    
    UITextField *input = [self.view findViewByName:@"input"];
    [input addTarget:self action:@selector(textFieldChanged:) forControlEvents:UIControlEventEditingChanged];

    [input becomeFirstResponder];
    
    UIButton *cancel = [self.view findViewByName:@"btn_cancel"];
    [cancel setClickBlock:^(UIButton * _Nonnull button) {
        
        [UIView animateWithDuration:0.3 animations:^{
            //            ViewGroup *vg = (ViewGroup *)self.view;
            //            [vg boundsAndRefreshLayout];
            [button dismissViewControllerAnimated:YES completion:nil];
        }];
        
    }];
    
    return self;
}

- (void)textFieldChanged:(UITextField*)textField{
    NSString *string = textField.text;
    self.text = string;
    [self performSelector:@selector(startSearch:) withObject:string afterDelay:0.6];
}

- (void)startSearch:(NSString *)string {
    if ([string isEqualToString:self.text]) {
        NSLog(@"开始搜索 %@",string);
        [self.delegate onViewAction:@"action_search" data:string];
    }
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
    search.layer.borderColor = [ColorUtils colorWithString:@"#e5e5e5"].CGColor;
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
    
    UITextField *input = [self.view findViewByName:@"input"];
    //    input.backgroundColor = [UIColor redColor];
    [input becomeFirstResponder];
    input.placeholder = @"搜索人或角色名";
    CGRect searchRect = search.frame;
    [UIView animateWithDuration:0.3 animations:^{
        CGRect rect = input.frame;
        rect.origin.x += 10;
        rect.size.width = searchRect.size.width - 50;
        input.frame = rect;
    }];
}

@end
