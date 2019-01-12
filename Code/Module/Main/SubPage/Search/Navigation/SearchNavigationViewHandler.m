//
//  SearchNavigationViewHandler.m
//  APP
//
//  Created by BinGe on 2019/1/12.
//

#import "SearchNavigationViewHandler.h"

@interface SearchNavigationViewHandler()<UITextFieldDelegate>

@property (nonatomic, copy) NSString *text;

@end

@implementation SearchNavigationViewHandler

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    [self searchAnimation];
    
    UIButton *button = [self.view findViewByName:@"btn_search"];
    [button setViewVisibility:ViewVisibilityInvisible];
    
    UITextField *input = [self.view findViewByName:@"input"];
    input.delegate = self;
    input.returnKeyType = UIReturnKeySearch;
    [input addTarget:self action:@selector(textFieldChanged:) forControlEvents:UIControlEventEditingChanged];

    [input becomeFirstResponder];
    
    WeakSelf(self)
    UIButton *cancel = [self.view findViewByName:@"btn_cancel"];
    [cancel setClickBlock:^(UIButton * _Nonnull button) {
        [button dismissViewControllerAnimated:YES completion:nil];
        [weakself.view endEditing:YES];
    }];
    
    return self;
}

- (void)setSearchText:(NSString *)text {
    UITextField *input = [self.view findViewByName:@"input"];
    input.text = text;
    [self textFieldChanged:input];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [self startSearch:textField.text];
    if (![NSString isEmpty:textField.text]) {
        NSMutableArray *array = [[Store valueForKey:@"search_history"] mutableCopy];
        if (!array) {
            array = [NSMutableArray new];
        }
        if (![array containsObject:textField.text]) {
            [array addObject:textField.text];
            if (array.count > 20) {
                [array removeObjectAtIndex:0];
            }
            [Store setValue:array forKey:@"search_history"];
            [self.delegate onViewAction:@"action_search_history_changed" data:array];
        }
        
        [textField resignFirstResponder];
        
        [self startSearch:textField.text];
    }
    return YES;
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
