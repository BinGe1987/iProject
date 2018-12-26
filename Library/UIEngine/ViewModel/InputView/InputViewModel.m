//
//  InputViewModel.m
//  APP
//
//  Created by BinGe on 2018/12/19.
//

#import "InputViewModel.h"

@interface InputViewModel()

@property (nonatomic, strong) InputView *inputView;

@end

@implementation InputViewModel

- (void)initialize {
    self.inputView = (InputView *)self.view;
    [self setTextViewParams:(InputViewParams *)self.inputView.viewParams];
}

- (void)setTextViewParams:(InputViewParams *)params {
    self.inputView.font = params.font;
    self.inputView.text = params.text;
    self.inputView.textColor = params.textColor;
    
    self.inputView.placeholder = params.placeholder;
    [self.inputView setValue:[UIColor redColor] forKeyPath:@"_placeholderLabel.textColor"];
    
    NSInteger left = params.paddingLeft;
    NSInteger right = params.paddingRight;
    self.inputView.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, left, 0)];
    self.inputView.leftViewMode = UITextFieldViewModeAlways;
    self.inputView.rightView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, right, 0)];
    self.inputView.rightViewMode = UITextFieldViewModeAlways;
}

- (Class)ViewClass {
    return [InputView class];
}
- (Class)ViewParamsClass {
    return [InputViewParams class];
}

@end
